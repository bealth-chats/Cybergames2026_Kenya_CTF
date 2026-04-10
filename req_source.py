import requests

# What if we can read the source code?
# The challenge description says "Some of them are already here and aren't even hidden."
# And "This app will hide all your secrets."
# Maybe there is an endpoint like `/api/v2/notes` that returns all notes for EVERYONE if we don't send a token?
r = requests.get("http://exp.cybergame.sk:7021/api/v2/notes")
print("No token:", r.text)

# What if we send a blank token?
r = requests.get("http://exp.cybergame.sk:7021/api/v2/notes", headers={"Authorization": "Bearer "})
print("Blank token:", r.text)
