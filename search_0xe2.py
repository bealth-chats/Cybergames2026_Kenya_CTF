with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for i, l in enumerate(lines):
    if "e2(%rsp)" in l or "122(%rsp)" in l:
        for j in range(max(0, i-5), i+5):
            print(lines[j].strip())
        print("---")
