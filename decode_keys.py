# Let's think logically.
# The user hint says: "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table, and the NFSR does a nonlinear feedback step using that same table, they feed into each other which is the "state coupling" part. The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions. You've got it, just trace how the two registers combine to generate each output byte and you're at the flag."
# "the flag literally spells out the two key components once you know what to look for."
# Wait, if "The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions", then the LFSR and NFSR are standard.
# "the flag literally spells out the two key components once you know what to look for."
# The two key components of the cipher? LFSR and NFSR? Or something else?
# Is the flag SK-CERT{LFSR_NFSR}? (Rejected)
# What if it's the S-box and the LCG? SK-CERT{LCG_SBOX}?
# What if it's the seed components? SK-CERT{LFSR_LCG}?
print("Let's guess SK-CERT{LFSR_LCG}")
