import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
mutation {
  login(email: "luna.belle@equestriasociety.com", password: "CorrectHorseBatteryStaple?") {
    token
    user {
      id
      email
      name
    }
  }
}
"""

response = requests.post(url, json={'query': query})
print(json.dumps(response.json(), indent=2))
