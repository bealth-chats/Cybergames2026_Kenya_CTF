# Let's consider: "just trace how the two registers combine to generate each output byte and you're at the flag."
# Output byte generation in 2e10:
# 2f14: xor (%r14,%r13,1), %r12b     (r12b is the output byte accumulator?)
# 2f18: xor 0x7(%rsp), %r12b
# 2f1d: xor %al, %r12b
# 2f20: xor %r15b, %r12b
# Wait! How do the two registers combine to generate each output byte?
# "they feed into each other which is the 'state coupling' part."
# "the flag literally spells out the two key components once you know what to look for."

# LFSR and NFSR are standard components.
# BUT he says "The LFSR initialises 16 nibbles via a simple LCG ... XOR'd with a coupling table, and the NFSR does a nonlinear feedback step using that same table"
# LCG and SBOX?
# Are LCG and SBOX the two key components?
# "the flag literally spells out the two key components once you know what to look for."
# If I write out "LCG" and "SBOX", it spells SK-CERT{LCG_SBOX}?
# Or maybe the coupling table contains the flag?
# The coupling table is 16 bytes: \xc5#\xd9\xa0\xb5g\x1fe\xaf\xfbBG\x18\x186R
# "trace how the two registers combine to generate each output byte and you're at the flag."
# The two registers combine using an XOR:
# `xor (%r14,%r13,1), %r12b` -> r14 is rodata SBOX.
