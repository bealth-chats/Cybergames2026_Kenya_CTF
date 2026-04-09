with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for i, l in enumerate(lines):
    if "1e50:" in l and "<" in l:
        for j in range(i, i+30):
            print(lines[j].strip())
        break
