import requests
import json
import hashlib

# passwordHash: "c455f922591bd7186e868be48134cd84679a0f2b8c1cdc71d4df8c4d4519a8e5" for Luna
# maybe simple passwords?
with open('/usr/share/dict/words', 'r') as f:
    for word in f.readlines():
        word = word.strip()
        h = hashlib.sha256(word.encode()).hexdigest()
        if h == "c455f922591bd7186e868be48134cd84679a0f2b8c1cdc71d4df8c4d4519a8e5":
            print(f"Luna password: {word}")
        if h == "746ee90df9a499796b427e0adf0f8db4852dc57fbd46d9702c1b4a0840984105":
            print(f"Melody password: {word}")

print("Done with words")
