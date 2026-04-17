import requests

def get_islands():
    overpass_url = "https://overpass-api.de/api/interpreter"
    overpass_query = """
    [out:json];
    (
      node["place"="island"](45.3, -75.8, 45.4, -75.7);
      way["place"="island"](45.3, -75.8, 45.4, -75.7);
      relation["place"="island"](45.3, -75.8, 45.4, -75.7);
    );
    out center;
    """
    try:
        response = requests.post(overpass_url, data={'data': overpass_query}, timeout=30)
        data = response.json()
        for element in data['elements']:
            if 'tags' in element and 'name' in element['tags']:
                print(element['tags']['name'], element.get('lat', element.get('center', {}).get('lat')), element.get('lon', element.get('center', {}).get('lon')))
    except Exception as e:
        print(f"Failed: {e}")

get_islands()
