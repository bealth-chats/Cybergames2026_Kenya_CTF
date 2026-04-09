coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]

# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# It initializes 16 nibbles? Wait!
# 16 nibbles is 8 bytes. Or maybe it means 16 values (each a nibble or byte).
# The coupling table is 16 bytes.
# If we compute (LCG_n) ^ coupling_table_n = ASCII char of the flag!
# Let's try 16-bit LCG state.
# What is the seed? The seed is 0?
for seed in range(65536):
    state = seed
    s = ""
    for i in range(16):
        # 2a40: imul $0x6d, ebx
        # add $0x3d, ebx
        state = (state * 0x6d + 0x3d) & 0xffffffff
        # movzwl bx, r14d
        # shr $0x7, r14d
        val = (state & 0xffff) >> 7
        char = val ^ coupling_table[i]
        s += chr(char)
    if "SK-CERT" in s or "LFSR" in s or "NFSR" in s or "SBOX" in s:
        print(f"seed={seed}: {s}")
