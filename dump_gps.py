import struct
import re

with open('telemetry.data', 'rb') as f:
    data = f.read()

print(f"Data size: {len(data)} bytes")

# try to find the flag in the text
flag_match = re.search(b'SK-CERT{[^}]+}', data)
if flag_match:
    print(f"Found flag directly: {flag_match.group(0)}")

# Let's search for some strings that might indicate GPS coordinates or similar.
import string
def extract_strings(data, min_length=4):
    result = ""
    for b in data:
        c = chr(b)
        if c in string.printable:
            result += c
        else:
            if len(result) >= min_length:
                yield result
            result = ""
    if len(result) >= min_length:
        yield result

for s in list(extract_strings(data))[:10]:
    print(s)
