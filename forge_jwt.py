import requests

url = 'https://mail.equestriasociety.com/images../secretbackend/api'
try:
    r = requests.get(f"{url}/notes/1")
    print(r.status_code)
except Exception as e:
    print("Error:", e)
