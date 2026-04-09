with open('beacon.asm', 'r') as f:
    lines = f.readlines()

for i, l in enumerate(lines):
    if "4090" in l and "call" in l:
        print(l.strip())
    if "40e0" in l and "call" in l:
        print(l.strip())

# The calls to the 18 functions are made via function pointer table!
# `call *0x0(%r13,%rax,8)`
# This is at 1edb and 1f0c.
