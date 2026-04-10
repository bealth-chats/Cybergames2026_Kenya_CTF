import requests

# Let's write a python script to test prototype pollution variables that might bypass bcrypt.
# The `bcrypt` module expects `req.body.password` and `user.password` (from DB).
# If we set `__proto__: {"password": "admin"}`, and the user from DB is `admin`, their password hash is fetched.
# If `user` has NO password, it would fall back to `__proto__`. But `admin` probably has a password.

# BUT wait! We were getting RangeError on `login` because of express-validator or SQLite.
# Let's look closely at:
# RangeError: Too few parameter values were provided
#   at /app/routes/v2.js:37:69

# It implies that the query expects X parameters, but got fewer.
# If the query is like `db.get("SELECT * FROM users WHERE username = ? AND password = ?", [req.body.username, req.body.password])`
# AND we pass `req.body.password` as an object like `{"$gt": ""}`?
# SQLite driver converts arrays into parameters. If it receives an object, maybe it fails to count it properly?
# Wait! If the code is:
# db.get('SELECT * FROM users WHERE username = ?', [req.body.username], (err, row) => ...)
# If `req.body.username` is an array: `["admin"]`, then the driver sees an array instead of a single string.
# BUT wait! If `req.body.username` is an array of MULTIPLE strings? `["admin", "password"]`?
