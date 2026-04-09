# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# The coupling table is at 0x1105260. Let's see what's there!
import struct

with open('beacon', 'rb') as f:
    f.seek(0x1105260 - 0x1106388 + 17851272)
    # wait, the address 1105260 is inside .rodata.
    # 0x1105000 is rodata.
    f.seek(0x5000 + (0x1105260 - 0x1105000))
    data = f.read(16)

print(data)
print("".join([chr(c) if 32 <= c <= 126 else '.' for c in data]))
