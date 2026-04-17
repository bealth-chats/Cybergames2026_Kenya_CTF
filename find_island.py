import requests
import json
import time

overpass_url = "https://overpass-api.de/api/interpreter"
overpass_query = """
[out:json];
(
  node["place"="island"](45.2, -75.9, 45.5, -75.5);
  way["place"="island"](45.2, -75.9, 45.5, -75.5);
  relation["place"="island"](45.2, -75.9, 45.5, -75.5);
  node["place"="islet"](45.2, -75.9, 45.5, -75.5);
  way["place"="islet"](45.2, -75.9, 45.5, -75.5);
  relation["place"="islet"](45.2, -75.9, 45.5, -75.5);
);
out center;
"""

success = False
for i in range(5):
    try:
        response = requests.post(overpass_url, data={'data': overpass_query}, timeout=30)
        data = response.json()
        for element in data['elements']:
            if 'tags' in element and 'name' in element['tags']:
                print(element['tags']['name'], element.get('lat', element.get('center', {}).get('lat')), element.get('lon', element.get('center', {}).get('lon')))
        success = True
        break
    except Exception as e:
        print(f"Attempt {i+1} failed: {e}")
        time.sleep(2)
