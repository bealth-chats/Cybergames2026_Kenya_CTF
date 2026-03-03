# Forensics CTF Challenge Write-up: network.pcap

## Challenge Description
We received a PCAP capture from a corporate network device after a suspected incident. Help us investigate what happened.
Hint: the http version

## Objective
Find the hidden flag in the provided `network.pcap` file. The expected flag format is `SK-CERT{...}`.

## Solution

### Step 1: Analyze the PCAP file
The first step is to analyze the PCAP file. Using `tshark`, a network protocol analyzer, we can get a quick overview of the network traffic. Since the hint points to the HTTP version, we can filter the capture for HTTP traffic and look at the HTTP versions being used.

```bash
tshark -r network.pcap -Y "http" -T fields -e http.request.version
```

### Step 2: Identify the Anomaly
By running the command above, we notice that the HTTP versions in the requests alternate between `HTTP/1.0` and `HTTP/1.1`. Let's count the occurrences:

```bash
tshark -r network.pcap -Y "http" -T fields -e http.request.version | sort | uniq -c
```

This returns:
```
    296
    149 HTTP/1.0
    147 HTTP/1.1
```

### Step 3: Extract the Binary Payload
The alternating HTTP versions (`1.0` and `1.1`) are a classic steganography technique used to hide data. We can treat `HTTP/1.0` as binary `0` and `HTTP/1.1` as binary `1`.

We can extract the sequence of HTTP versions, remove the `HTTP/1.` part, and concatenate the remaining `0`s and `1`s into a single binary string.

```bash
tshark -r network.pcap -Y "http" -T fields -e http.request.version | grep "HTTP" | sed -e 's/HTTP\/1.//g' | tr -d '\n'
```

This command extracts the binary string:
`01010011010010110010110101000011010001010101001001010100011110110110100000110001010001000100010000110011011011100101111100110001011011100101111101110000011011000011010000110001011011100011011101100101010110000011011101011111011011100011001100110111010001100110110000110000011101110111110100001010`

### Step 4: Convert Binary to ASCII
The final step is to convert the extracted binary string into ASCII characters to reveal the flag. We can use Python for this:

```python
binary = '010100110100101100101101010000110100010101010010010101000111101101101000001100010100010001000100001100110110111001011111001100010110111001011111011100000110110000110100001100010110111000110111011001010101100000110111010111110110111000110011001101110100011001101100001100000111011101111101'
text = ''.join(chr(int(binary[i:i+8], 2)) for i in range(0, len(binary), 8))
print(text)
```

This outputs the flag:
`SK-CERT{h1DD3n_1n_pl41n7eX7_n37Fl0w}`

## Flag
`SK-CERT{h1DD3n_1n_pl41n7eX7_n37Fl0w}`
