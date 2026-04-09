# "the flag literally spells out the two key components once you know what to look for."
# Wait, Grain uses LFSR and NFSR.
# What are the names of the two key components?
# The custom S-box and the LCG!
# SK-CERT{SBOX_LCG} ?
# SK-CERT{LCG_SBOX} ?
# Let's write SK-CERT{SBOX_LCG} and SK-CERT{LCG_SBOX} to flag.txt.
# No, "The LFSR initialises 16 nibbles... and the NFSR does a nonlinear feedback step... they feed into each other which is the 'state coupling' part."
# Then: "The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions."
# Then: "You've got it, just trace how the two registers combine to generate each output byte and you're at the flag."
# "the flag literally spells out the two key components once you know what to look for."
# So if I TRACE how the two registers combine to generate each output byte...
