# Let's read the binary for 0x6d and 0x3d.
with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for l in lines:
    if "6d" in l and "imul" in l:
        print(l.strip())
    if "3d" in l and "add" in l:
        pass
