# So we DO have a user oracle!
# We can test if ANY exact username exists.
# But we can't test partial strings because we can't use `LIKE` or `%`.
# Unless we can pass `LIKE` somehow?
# Can we? The query is `WHERE username = ?`. We can't change `=` to `LIKE`.
# And `?` does not allow wildcards unless the operator is `LIKE`.
# So we can only test EXACT usernames.

# If we know `admin` exists. We don't know the password.
# Is the flag the username of some user? Unlikely we can guess it exactly.
# Is the flag in the notes of `admin`?
# How do we read notes of `admin`?
# We need to log in as `admin`.
# Can we bypass `bcrypt.compareSync`?
# If `user.password` is undefined, `bcrypt.compareSync(req.body.password, undefined)` throws an error.
# But `admin` HAS a password hash.
# What if we use prototype pollution to make `req.body.password` equal to the hash?
# We don't know the hash.

# What if we use prototype pollution to bypass JWT validation?
# The JWT is validated using `jsonwebtoken`.
# The secret is `process.env.JWT_SECRET` or similar.
# Can we pollute the `secret`?
# In `jsonwebtoken`'s `verify` function: `jwt.verify(token, secretOrPublicKey, [options, callback])`
# If `secretOrPublicKey` is undefined, it might throw an error.
# But maybe we can pollute the `algorithms` array?
# Wait! In express-jwt or similar middlewares, sometimes the secret is retrieved from `req.app.get('jwt-secret')` or something.
# Let's check prototype pollution in `jwt.verify`.
