import requests
import json
import time

# Ottawa coords: ~ 45.4215, -75.6972
# Let's search around Algonquin College Ottawa Campus
# The campus is at Woodroffe Ave. Coordinates: ~ 45.3486, -75.7594
target_lat = 45.3486
target_lon = -75.7594

# Searching for islands around Ottawa/Algonquin
overpass_url = "https://lz4.overpass-api.de/api/interpreter"
overpass_query = f"""
[out:json];
(
  node["place"="island"](around:20000, {target_lat}, {target_lon});
  way["place"="island"](around:20000, {target_lat}, {target_lon});
  relation["place"="island"](around:20000, {target_lat}, {target_lon});
  node["place"="islet"](around:20000, {target_lat}, {target_lon});
  way["place"="islet"](around:20000, {target_lat}, {target_lon});
  relation["place"="islet"](around:20000, {target_lat}, {target_lon});
);
out center;
"""

for i in range(5):
    try:
        response = requests.post(overpass_url, data={'data': overpass_query}, timeout=30)
        data = response.json()
        for element in data['elements']:
            if 'tags' in element and 'name' in element['tags']:
                print(element['tags']['name'], element.get('lat', element.get('center', {}).get('lat')), element.get('lon', element.get('center', {}).get('lon')))
        break
    except Exception as e:
        print(f"Attempt {i+1} failed: {e}")
        time.sleep(2)
