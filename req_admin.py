import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
r = requests.post(url, json={"username": "admin", "password": "admin"})
token = r.json().get("token")
print("Admin token:", token)

r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": f"Bearer {token}"})
print("Admin notes:", r2.text)
