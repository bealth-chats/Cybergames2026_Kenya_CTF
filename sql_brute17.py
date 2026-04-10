import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# So if `req.body.username` is passed as the parameter list:
# That means the code is like `db.get("SELECT * FROM users WHERE username = ?", req.body.username)`
# Wait, if req.body.username is an array, `node-sqlite3` expands it to multiple parameters for multiple `?` !
# If req.body.username is a string, it uses it as the single parameter for `?` !
# Wait, can we provide a prototype polluted property?
# If we do `{"username": "admin", "password": "password"}` -> uses `"admin"` as 1 parameter. Works.
# If we do `{"username": ["admin"], "password": "password"}` -> uses `["admin"]` as 1 parameter. Works?
# But `["admin"]` returned "Invalid credentials"!
# Why did `["admin"]` return "Invalid credentials"? Because `db.get("... WHERE username = ?", ["admin"])` executes successfully!
# Wait, if `["admin"]` executes successfully but returns "Invalid credentials", maybe `username` of admin doesn't match? No, if it matched, it would say "Invalid credentials" because password didn't match.

# Wait, if we use `["admin"]` as `username`, then `req.body.username` is `["admin"]`.
# The query executes fine, and maybe it finds the user "admin"!
# Then `bcrypt.compareSync(req.body.password, user.password)` is called.
# And returns false, so "Invalid credentials".
