# Wait, if `req.body.username` is passed as parameters, and we can pass an object/array,
# can we inject SQL?
# `sqlite3` driver `db.get("SELECT ...", params)` DOES NOT allow SQL injection in the parameters!
# The parameters are strictly bound.

# BUT!
# What if the code is `db.get("SELECT * FROM users WHERE username = '" + req.body.username + "'")` ?
# If it was string concatenation, `req.body.username` being an object `{"$gt": ""}` would become `"[object Object]"` and it would execute fine and not throw "RangeError: Too few parameter values were provided"!
# Since it throws RangeError, the driver IS using parameterized queries!
# But wait, why does it throw RangeError if we provide `{"$gt": ""}`?
# Because `db.get(query, {"$gt": ""})` expects named parameters in the query if an object is passed, OR it treats the object as arguments.
# In `node-sqlite3`, `db.get(query, param1, param2...)` can take an array, object, or variable arguments.
# If `req.body.username` is an object `{"$gt": ""}`, sqlite3 treats it as an object of named parameters!
# But the query has `?` instead of `$name`! So it says "Too few parameter values were provided" because it found `?` but no positional parameters were provided (since an object provides named parameters).
