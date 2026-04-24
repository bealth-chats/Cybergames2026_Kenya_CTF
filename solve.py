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
