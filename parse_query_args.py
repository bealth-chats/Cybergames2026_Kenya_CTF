import json

with open('query_args.json', 'r') as f:
    data = json.load(f)

fields = data.get('data', {}).get('__schema', {}).get('queryType', {}).get('fields', [])

for f in fields:
    print(f"Query: {f['name']}")
    for a in f.get('args', []):
        t = a['type']
        type_name = t['name'] if t['name'] else t['ofType']['name']
        print(f"  Arg: {a['name']} ({type_name})")
