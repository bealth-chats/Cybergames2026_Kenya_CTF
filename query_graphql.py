import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
query {
  __schema {
    types {
      name
      kind
      description
      fields {
        name
      }
    }
  }
}
"""

response = requests.post(url, json={'query': query})
print(json.dumps(response.json(), indent=2))
