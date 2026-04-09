# Let's try 8-bit LCG starting from 1 to 255.
coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]

for start in range(256):
    state = start
    s = ""
    for i in range(16):
        s += chr(state ^ coupling_table[i])
        state = (state * 0x6d + 0x3d) & 0xff
    if all(32 <= ord(c) <= 126 for c in s):
        print(f"start={start}: {s}")
