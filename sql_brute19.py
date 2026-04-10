# If that's the case, the code must be:
# `db.get("SELECT * FROM users WHERE username = ?", req.body.username)`
# If `req.body.username` is an object, it throws RangeError.
# If `req.body.username` is a string "admin", it passes "admin" as the first parameter. Works.
# If `req.body.username` is an array ["admin", "password"], it passes "admin" and "password" as parameters. Since there's only one "?", it says "Too many parameter values were provided".
# This confirms the query is EXACTLY:
# `db.get("SELECT * FROM users WHERE username = ?", req.body.username, (err, user) => ...)`

# Okay, so the DB query has NO SQL injection.
# And it fetches the user based on `username`.
# Then it does:
# `bcrypt.compareSync(req.body.password, user.password)`
# If `req.body.password` is an object (like `{"$gt": ""}`), `bcrypt` throws "Illegal arguments: object, string".

# This means the error "Illegal arguments: object, string" happens ONLY IF `user` is found!
# Because if `user` was not found, it would do something like `if (!user) return res.status(401).json({ error: 'Invalid credentials' });`
# So we DO have a username oracle!
# We can find out if a user exists by passing `password: {"$gt": ""}`!
# But wait, we can only test EXACT usernames because the query is `WHERE username = ?`!
# There is NO SQL injection in `WHERE username = ?`!
# So we can only brute-force exact usernames. We can't do regex matching!
# Earlier I did `{"username": {"$regex": "^SK-CERT{..."}, "password": {"$gt": ""}}`
# And it gave 500 RangeError! NOT 500 Illegal arguments!
