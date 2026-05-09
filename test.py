import requests

url = 'http://git.d34dh0rs3.equestriasociety.com:7000/'
try:
    r = requests.get(url, timeout=5)
    print(r.status_code)
except Exception as e:
    print("Error:", e)
