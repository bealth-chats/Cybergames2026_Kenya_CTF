# "If you've identified the state coupling structure you're basically there — the flag literally spells out the two key components once you know what to look for."
# Wait, look at the 16 bytes from 1105260:
# \xc5#\xd9\xa0\xb5g\x1fe\xaf\xfbBG\x18\x186R
# Is this the flag? No.
# What about the 16 nibbles?
# The string "LFSR" and "NFSR"?
# I already tried LFSR_NFSR and LFSR_NLFSR.
# What if it's "LFSR_NFSR" spelled out in the table, meaning the bytes of the table are somehow letters?
# Let's consider the LCG: x_{n} = (0x6d * x_{n-1} + 0x3d)
# If we start from some seed, we generate 16 nibbles (or bytes).
# Then XOR with the coupling table!
