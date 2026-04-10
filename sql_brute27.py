import requests

# Are there any other endpoints in the OpenAPI spec?
r = requests.get("http://exp.cybergame.sk:7021/api/v2/openapi.json", headers={"Accept": "application/json"})
if r.status_code == 200 and r.text.startswith('{'):
    print(r.json())
else:
    # try yaml
    r = requests.get("http://exp.cybergame.sk:7021/api/v2/openapi.yaml", headers={"Accept": "application/yaml"})
    if r.status_code == 200:
        print(r.text[:200])
