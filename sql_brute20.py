# So we DO have a way to check if a username exists.
# BUT we cannot do a partial match because it's EXACT string match in SQLite `WHERE username = ?`.
# Is the flag the username of some user?
# If the flag is `SK-CERT{...}`, we would have to guess the entire string.
# Is there a vulnerability in SQLite `db.get("SELECT * FROM users WHERE username = ?", req.body.username)`
# if we pass an Array or Object?
# Wait!
# What if we pass an object with named parameters like `{"?": "admin"}` or `{"$username": "admin"}`?
# NO, the query string is hardcoded `WHERE username = ?` which means it expects POSITIONAL parameters.
# Can we pass an array to `req.body.username`?
# `db.get(query, ["admin"])` -> works, finds "admin".
# What if the query has `WHERE username = ? AND password = ?`
# Then `db.get(query, ["admin", "wrong_password"])` -> works, finds nobody.

# But earlier we established the query is EXACTLY `WHERE username = ?`.
# Wait, if we can do prototype pollution, is there any way to bypass bcrypt?
# If we do `__proto__: { password: "fake_hash" }`?
# In sqlite3, rows are returned as plain JavaScript objects.
# DO they inherit from Object.prototype? YES!
# If the row returned from SQLite doesn't have a `password` column?
# It DOES have a password column, otherwise login wouldn't work for normal users.
# If `user.password` exists, it shadows `Object.prototype.password`.
