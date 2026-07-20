import requests
import json

url = 'https://mail.equestriasociety.com/graphql'
token = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJyZXF1ZXN0cmlhIiwiZXhwIjoxNzgwNzgxNDIzLCJpYXQiOjE3NzgzNjIyMjMsImlzcyI6InJlcXVlc3RyaWEiLCJqdGkiOiIzZWI5ZWVkNy0xODBjLTQ2MGYtOGFiYy1lNGZmNjY4ODE5ZTciLCJuYmYiOjE3NzgzNjIyMjIsInN1YiI6ImU2OGViOWVlLTQ0YzEtNGEyYi1hMzVjLTczYmNiODA5NDNlMCIsInR5cCI6ImFjY2VzcyJ9.pIeX4J8lRFqKfjxztf_VQdQ5lzSiBJBkUq5z_5crz32ANzU7fDMWxWU7HLHp7a7WO9svBUkOsGQ6_pv-BXs2uw'
headers = {'Authorization': f'Bearer {token}'}
query = """
query {
  messages {
    id
    subject
    body
    sender {
      email
    }
  }
}
"""

response = requests.post(url, json={'query': query}, headers=headers)
print(json.dumps(response.json(), indent=2))
