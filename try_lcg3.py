# Let's consider:
# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# What is the size of the LCG?
# In 2a40 we saw:
# imul $0x6d, %ebx, %ebx
# add $0x3d, %ebx
# Wait! %ebx is a 32-bit register!
# And what does it output?
# movzwl %bx, %r14d
# shr $0x7, %r14d
# So it shifts right by 7 bits!
# Then it reads from the coupling table at `1105260` + offset?
# Wait! The table is not 16 bytes!
# 1105260 is inside .rodata.
# The table is an S-box!
# No, "there's a 1MB lookup table baked into .rodata instead of standard Grain boolean functions"
# And "XOR'd with a coupling table"
# Maybe the table is the 16 bytes: \xc5#\xd9\xa0\xb5g\x1fe\xaf\xfbBG\x18\x186R.
# The flag is spelling out the two key components!
# "the flag literally spells out the two key components once you know what to look for."
# Wait, "the flag literally spells out the two key components"
# "two key components":
# "The LFSR initialises 16 nibbles via a simple LCG ... and the NFSR does a nonlinear feedback step using that same table"
# Is the flag SK-CERT{LCG_SBOX}? Or SK-CERT{LCG_SBOX}? SK-CERT{LFSR_NFSR}?
