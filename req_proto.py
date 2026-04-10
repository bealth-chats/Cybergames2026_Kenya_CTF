import requests

url = "http://exp.cybergame.sk:7021/api/v2/login"
headers = {"Content-Type": "application/json"}

# prototype pollution might be useful to bypass `req.body.username && req.body.password` checks
# or in the sqlite driver!
# what if we pollute `_properties` or something?
# wait, the description says "Some of them are already here and aren't even hidden."
# Wait, "aren't even hidden". Are the notes available somewhere?
# Is there an endpoint we missed?
# /api/v2/notes
# /api/v1/notes
# /api/openapi.json
# Wait! /api/openapi.json is an endpoint!
# Did I fetch it correctly?
