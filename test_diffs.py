nfsr_taps = [0x11, 0x1d, 0x2d, 0x3b, 0x4f, 0x5c, 0x67, 0x79]
lfsr_taps = [0x03, 0x1d, 0x27, 0x33, 0x45, 0x59, 0x61, 0x77]

for x in nfsr_taps:
    print(chr(x ^ 0x55), end="")
print()

for x in lfsr_taps:
    print(chr(x ^ 0x55), end="")
print()

# "the flag literally spells out the two key components once you know what to look for."
# Two key components of Grain-like ciphers:
# 1. NFSR
# 2. LFSR
# Does it mean the flag is "LFSR_NFSR" or "LFSR-NFSR" or "LFSRNFSR"?
