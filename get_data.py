import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
query = """
query {
  newsFeed {
    id
    title
    content
    author {
      id
      email
      name
      subOrganization {
        name
        members {
          id
          email
          name
          role
        }
      }
    }
  }
}
"""

response = requests.post(url, json={'query': query})
print(json.dumps(response.json(), indent=2))
