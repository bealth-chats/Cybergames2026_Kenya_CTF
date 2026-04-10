import requests
import json

# What if `admin` is not the user with the flag?
# "Some of them are already here and aren't even hidden."
# Maybe the flag is in the response of some other user's note?
# Or maybe the flag is a user's username? But we couldn't find a username starting with SK-CERT{...} earlier because the regex was acting weird.
# Wait, let's re-run the regex NoSQL check!
# If the regex gave 500 for ALL users, that means ANY object passed as username to sqlite3 `db.get` throws 500 IF the username EXISTS?
# NO!
# It threw 500 for `{"$regex": "^SK-CERT{.*"}` because `{"$regex": "^SK-CERT{.*"}` was passed as `req.body.username`!
# `db.get("SELECT * FROM users WHERE username = ?", req.body.username)`
# Since `req.body.username` is an Object, `sqlite3` tries to bind it.
# Because it's an object `{"$regex": "^SK-CERT{.*"}`, it has ONE key: `"$regex"`.
# In SQLite, named parameters start with `$`, `:`, or `@`.
# So `{"$regex": "..."}` provides a named parameter `$regex`!
# BUT the query is `WHERE username = ?`, which expects a POSITIONAL parameter (index 1).
# So `sqlite3` driver sees `?` (positional) but we provided `$regex` (named).
# So it throws "RangeError: Too few parameter values were provided" because it expected 1 positional parameter, but we provided 0 positional parameters!

# This perfectly explains why `{"username": {"$gt": ""}}` ALSO threw RangeError!
# It's because `$gt` is a named parameter!
# What if we pass `{"1": "admin"}`?
# Named parameters in sqlite3 MUST start with `$`, `:`, or `@`.
# So `{"1": "admin"}` provides no named parameters and no positional parameters. Throws RangeError!

# What if we pass an array?
# `{"username": ["admin"]}` -> provides 1 positional parameter ("admin").
# `db.get` binds "admin" to `?`.
# It executes successfully!
# If it finds "admin", it checks bcrypt and returns "Invalid credentials" (401).
# If it DOES NOT find "admin", it returns "Invalid credentials" (401) without checking bcrypt.
# Wait, if `["admin"]` returns 401, how did we get 500 with `{"username": "admin", "password": {"$gt": ""}}`?
# Ah! Because `{"$gt": ""}` was passed as `password`!
# `bcrypt.compareSync(req.body.password, user.password)`
# `req.body.password` is an object `{"$gt": ""}`.
# `bcrypt.compareSync` expects a string. It throws "Error: Illegal arguments: object, string"!

# So we CAN check if a user exists by passing `{"username": "guess", "password": {"$gt": ""}}`!
# If user exists, `db.get` returns the user. Then `bcrypt.compareSync({"$gt": ""}, hash)` throws 500!
# If user DOES NOT exist, `db.get` returns `undefined`. The code does `if (!user) return 401`.
# So we get 401!
