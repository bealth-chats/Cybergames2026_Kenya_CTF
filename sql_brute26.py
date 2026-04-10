# If PUT says "Note not found", it probably does `WHERE id = ? AND user_id = ?`.
# Since `user_id` doesn't match our token's `id`, it returns 404.
# What if we delete note 1?
import requests

r_reg = requests.post("http://exp.cybergame.sk:7021/api/v2/register", json={"username": "admin2013", "password": "password"}, headers={"Content-Type": "application/json"})
token = r_reg.json().get("token")

r = requests.delete("http://exp.cybergame.sk:7021/api/v2/notes/1", headers={"Authorization": f"Bearer {token}"})
print("DELETE note 1 v2:", r.status_code, r.text)
