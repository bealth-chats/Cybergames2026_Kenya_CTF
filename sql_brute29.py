# Let's brute-force the length of the `password` using SQLite operations?
# We have a boolean oracle on `password` object passed to bcrypt.
# Wait, NO!
# The `password` we pass to login is checked by `bcrypt.compareSync`.
# We CANNOT pass an object that evaluates as true inside SQLite because SQLite DOES NOT evaluate `req.body.password`.
# The DB query is just `SELECT * FROM users WHERE username = ?` (with 1 parameter: username).
# Once it returns a user, the NODEJS CODE does `bcrypt.compareSync(req.body.password, user.password)`.
# So NO SQL INJECTION is possible to bypass the password check, because the password check is in Node.js!
# And `bcrypt.compareSync` cannot be bypassed with an object because it throws an error.

# So, the ONLY way to log in as a user is to know their password.
# Is the password of `admin` blank?
import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
r = requests.post(url, json={"username": "admin", "password": ""})
print(r.text)
r = requests.post(url, json={"username": "admin", "password": "admin"})
print(r.text)
r = requests.post(url, json={"username": "admin", "password": "password"})
print(r.text)
