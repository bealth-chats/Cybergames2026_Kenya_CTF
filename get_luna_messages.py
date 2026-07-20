import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
mutation {
  login(email: "luna.starlight@equestriasociety.com", password: "NewPassword123!") {
    token
  }
}
"""

response = requests.post(url, json={'query': query})
data = response.json()
if 'data' in data and data['data']['login']:
    token = data['data']['login']['token']
    headers = {'Authorization': f'Bearer {token}'}

    query = """
    query {
      messages {
        id
        subject
        body
      }
    }
    """
    r = requests.post(url, json={'query': query}, headers=headers)
    print(json.dumps(r.json(), indent=2))
