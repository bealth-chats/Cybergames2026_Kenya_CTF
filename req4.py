import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# So ANY object passed to username returns 500. This is because it's NOT a NoSQL database!
# It's passing the Javascript object directly to the database driver (like sqlite3, mysql2, pg),
# and the driver is throwing an error or something, or actually it's returning ALL rows or the first row.
# If it returns the FIRST row, the first user is probably `admin`!
# Let's test if we can login as the first user (admin) by just passing a wrong password but making the query work.
# Wait, if we know the first user is admin, we still need their password because bcrypt checks it.
# Can we bypass bcrypt?

# Or wait, what if we pass prototype pollution to bypass bcrypt?
# Bcrypt checks: bcrypt.compareSync(req.body.password, user.password)
# If we do: {"username": "admin", "password": "a", "__proto__": {"password": "a"}}
# does user.password become "a"?
# No, because `user` is returned from the DB. `user.password` would be the real hash.
# Unless `user` doesn't have a `password` field, in which case it would inherit from `__proto__`.
# BUT it probably does have a password field from the DB.

# Is there any other field we can pollute?
# What about polluting something that affects the query?
pass
