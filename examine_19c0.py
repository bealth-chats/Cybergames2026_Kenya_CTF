with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for i, l in enumerate(lines):
    if "19c0:" in l and "<" in l:
        for j in range(max(0, i-5), i+20):
            print(lines[j].strip())
        print("---")
