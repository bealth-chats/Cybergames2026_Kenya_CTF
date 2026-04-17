import requests

def search_wikipedia(query):
    url = "https://en.wikipedia.org/w/api.php"
    params = {
        "action": "query",
        "list": "search",
        "srsearch": query,
        "format": "json"
    }
    headers = {
        "User-Agent": "Bot/1.0 (test@example.com)"
    }
    response = requests.get(url, params=params, headers=headers)
    try:
        data = response.json()
        for item in data['query']['search']:
            print(item['title'])
    except Exception as e:
        print("Error:", response.text)

search_wikipedia("Algonquin Centre for Construction Excellence")
