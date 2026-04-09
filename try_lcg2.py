# What if it's not a 8-bit LCG?
# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# NIBBLES! 16 nibbles = 8 bytes.
# Wait, the table is 16 bytes.
# "initialises 16 nibbles via a simple LCG"
# What if the LCG operates on 4-bit numbers (nibbles)?
# modulo 16!
coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]

for start in range(16):
    state = start
    chars = []
    for i in range(16):
        state = (state * 0x6d + 0x3d) & 0xf
        val = state ^ (coupling_table[i] & 0xf)
        chars.append(val)

    print(start, chars)
