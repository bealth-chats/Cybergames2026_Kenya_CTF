import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
mutation {
  login(email: "luna.belle@equestriasociety.com", password: "CorrectHorseBatteryStaple?") {
    token
  }
}
"""

response = requests.post(url, json={'query': query})
data = response.json()
if 'data' in data and data['data']['login']:
    token = data['data']['login']['token']
    headers = {'Authorization': f'Bearer {token}'}

    # Is there a GraphQL injection in login, updateProfile, or any other query?
    query = """
    mutation {
      createSsoConfiguration(name: "Test", provider: "oauth2", domain: "example.com", clientId: "123", clientSecret: "123", enabled: true) {
        id
      }
    }
    """
    r = requests.post(url, json={'query': query}, headers=headers)
    print(json.dumps(r.json(), indent=2))
