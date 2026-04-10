import requests

# What if "Some of them are already here and aren't even hidden" means the flag is in the frontend code?
r = requests.get("http://exp.cybergame.sk:7021/app.js")
print("app.js flag:", "SK-CERT" in r.text)

r = requests.get("http://exp.cybergame.sk:7021/styles.css")
print("styles.css flag:", "SK-CERT" in r.text)

r = requests.get("http://exp.cybergame.sk:7021/")
print("index.html flag:", "SK-CERT" in r.text)
