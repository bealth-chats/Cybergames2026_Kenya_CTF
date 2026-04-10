import requests
import json
import base64

# Let's decode the JWT token again to see what's in it.
r_reg = requests.post("http://exp.cybergame.sk:7021/api/v2/register", json={"username": "admin2014", "password": "password"}, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")
print("Token:", token)

# If we can pollute something in express-jwt?
# wait, what if the secret IS empty or we can make it empty?
# No, we tried algorithm: 'none'. What about "HS256" and empty secret?
