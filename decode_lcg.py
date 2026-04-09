coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]

for start in range(256):
    state = start
    chars = []
    for i in range(16):
        state = (state * 0x6d + 0x3d) & 0xff
        val = state ^ coupling_table[i]
        chars.append(val)

    # check if LFSR or NFSR is in the decoded string
    s = "".join(chr(c) if 32 <= c <= 126 else '.' for c in chars)
    if "LFSR" in s or "NFSR" in s:
        print(f"start {start}: {s}")
