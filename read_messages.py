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

    # Can we just reset Luna Starlight's password using updateUser?
    query = """
    mutation {
      updateUser(id: "401b2b45-603b-4ca1-a87e-a5df685b20d9", password: "NewPassword123!") {
        id
        email
      }
    }
    """
    r = requests.post(url, json={'query': query}, headers=headers)
    print("updateUser Luna Starlight:")
    print(json.dumps(r.json(), indent=2))
