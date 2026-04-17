import requests

overpass_url = "https://maps.mail.ru/osm/tools/overpass/api/interpreter"
overpass_query = """
[out:json];
(
  node["name"~"Point Island", i];
  way["name"~"Point Island", i];
  relation["name"~"Point Island", i];
);
out center;
"""
response = requests.post(overpass_url, data={'data': overpass_query})
try:
    data = response.json()
    for element in data['elements']:
        if 'tags' in element and 'name' in element['tags']:
            print(element['tags']['name'], element.get('lat', element.get('center', {}).get('lat')), element.get('lon', element.get('center', {}).get('lon')))
except Exception as e:
    print("Error:", e)
