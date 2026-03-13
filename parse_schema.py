import json

with open('schema.json', 'r') as f:
    data = json.load(f)

types = data.get('data', {}).get('__schema', {}).get('types', [])

for t in types:
    if not t['name'].startswith('__'):
        print(f"Type: {t['name']}")
        if t['fields']:
            for f in t['fields']:
                print(f"  Field: {f['name']}")
        print()
