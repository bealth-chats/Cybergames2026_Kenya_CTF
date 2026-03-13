import json

with open('schema.json', 'r') as f:
    data = json.load(f)

types = data.get('data', {}).get('__schema', {}).get('types', [])

for t in types:
    if t['name'] == 'RootQueryType':
        for f in t['fields']:
            print(f"Query: {f['name']}")
            if f.get('args'):
                for a in f['args']:
                    print(f"  Arg: {a['name']}")
