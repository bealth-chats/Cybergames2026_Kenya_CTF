# Malware Analysis CTF Write-up: `less`

## Challenge Description
> I found this light weight version of less
> The flag format is SK-CERT{}

## Initial Analysis
We are provided with a binary named `less`.

First, let's determine the file type:
```bash
file less
# less: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=cdc73071483e61f9d68b21e23183aadd1c74e1d3, for GNU/Linux 3.2.0, not stripped
```

Checking basic strings in the binary:
```bash
strings less
```
We can see the presence of some interesting string literals and function names:
- `decode_phrase_from_file`
- `sha256_transform`, `sha256_init`, `sha256_update`, `sha256_final`, `sha256_hex`
- `TARGET_HASHES`
- A list of 40 SHA256 hashes

## Reverse Engineering
To understand how these hashes are used, we can disassemble the binary and inspect `decode_phrase_from_file`.

```bash
objdump -d less | grep -C 20 TARGET_HASHES
```

Looking at the assembly for `decode_phrase_from_file`, we can trace the logic:
1. It reads bytes from an input file.
2. It fetches pairs of characters (2 bytes) at a time (`movzbl` reading individual bytes).
3. It computes the SHA256 hex string of these 2-byte pairs using `sha256_hex`.
4. It compares the computed hash against a list of hardcoded hashes stored at `TARGET_HASHES` in the binary.
5. If the hash matches, it means the binary successfully decoded a part of a "phrase" from the file.

Since the hashes are derived from only 2-character (printable) strings, the keyspace is extremely small. We can simply extract the target hashes from the `.rodata` section and brute-force the 2-character combinations to recover the hidden phrase.

## Extracting Hashes
By analyzing the `.rodata` section with `objdump -s -j .rodata less`, we can manually or programmatically extract the list of 40 SHA256 hashes.

Alternatively, since they appear continuously in the binary strings, we can just `grep` for them:
```bash
strings less | grep -E '^[0-9a-f]{64}$' > hashes.txt
```

This successfully extracted exactly 40 hashes.

## Recovering the Flag
We can write a quick Python script to compute the SHA256 hashes for all 2-character combinations of printable characters, and map them back to the plaintext characters corresponding to the target hashes.

```python
import hashlib
import string
import itertools

with open("hashes.txt") as f:
    target_hashes = [l.strip() for l in f if l.strip()]

print(f"Found {len(target_hashes)} hashes.")

# Create a mapping of 2-char string -> sha256 hex
lookup = {}
for chars in itertools.product(string.printable, repeat=2):
    s = "".join(chars)
    h = hashlib.sha256(s.encode()).hexdigest()
    lookup[h] = s

flag = ""
for h in target_hashes:
    if h in lookup:
        flag += lookup[h]
    else:
        print(f"Hash {h} not found!")
        flag += "??"

print("Recovered:", flag)
```

Running the script gives us:
```
Found 40 hashes.
Recovered: echo 'where is the flag?' > flag.txt # SK-CERT{l99k1n6_f0r_h1dd3n_func710n4l17y}
```

The decoded phrase is a bash command payload containing the flag inside a comment.

## Flag
**SK-CERT{l99k1n6_f0r_h1dd3n_func710n4l17y}**
