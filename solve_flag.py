import struct

# Let's consider: "the flag literally spells out the two key components once you know what to look for."
# Wait, look at the hints again.
# "the custom S-box (there's a 1MB lookup table baked into .rodata instead of standard Grain boolean functions)"
# We found the 1MB lookup table at .rodata.
# But what if the flag is the names of the two key components?
# LFSR and NFSR.
# What are the polynomials or components used?
# The 16 functions evaluated to:
# 17, 29, 45, 59, 79, 92, 103, 121, 131, 157, 167, 179, 197, 217, 225, 247
# These are prime numbers? No.
# What if we treat them as ASCII codes?
# 17, 29, 45, 59, 79, 92, 103, 121, 131, 157, 167, 179, 197, 217, 225, 247
# Wait!
# 45 = '-'
# 59 = ';'
# 79 = 'O'
# 92 = '\'
# 103 = 'g'
# 121 = 'y'
# Doesn't spell anything.

# What about the differences?
diffs = [12, 16, 14, 20, 13, 11, 18, 10, 26, 10, 12, 18, 20, 8, 22]

# "the flag literally spells out the two key components once you know what to look for."
# The two key components of the cipher?
# The custom S-box is one component. The seeding mechanism is another?
# "The main differences are the custom S-box ... and the seeding mechanism ... If you've identified the state coupling structure you're basically there — the flag literally spells out the two key components once you know what to look for."
# Does the flag spell out LFSR and NFSR?
# But if it was SK-CERT{LFSR_NFSR}, it was rejected!
