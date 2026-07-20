import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
query {
  __type(name: "RootMutationType") {
    fields {
      name
      args {
        name
        type {
          name
          kind
          ofType {
            name
            kind
          }
        }
      }
    }
  }
}
"""
response = requests.post(url, json={'query': query})
print(json.dumps(response.json(), indent=2))
