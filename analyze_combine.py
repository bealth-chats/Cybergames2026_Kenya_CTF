with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for i, l in enumerate(lines):
    if "2f14:" in l:
        for j in range(max(0, i-5), i+15):
            print(lines[j].strip())
        break
