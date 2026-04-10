import requests
import json

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# What if we pass prototype pollution that modifies bcrypt's behavior?
# bcrypt doesn't read from Object.prototype as far as I know.
# What about jsonwebtoken?
# jwt.sign(payload, secret, options)
# We can pollute options!
# `algorithm: 'none'`
# `header: { alg: 'none' }`
