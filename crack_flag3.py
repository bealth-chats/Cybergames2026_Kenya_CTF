# Let's try 32-bit LCG
coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]

# The hint: "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# The coupling table is AT 0x1105260.
# Let me verify what is at 0x1105260!
# We printed: \xc5#\xd9\xa0\xb5g\x1fe\xaf\xfbBG\x18\x186R
# Is that the table?
# Look at 2a6c: lea 0x11027ed(%rip), %rcx  -> 1105260.
# The previous line is: cmovae %ecx, %edx  (if r12 >= 0xa, edx = r13 - 0x45, else r13 + 3)
# Then: movzbl (%rdx,%rcx,1), %ecx
# Wait, the index into the table is `edx`, which is `-0x45(%r13)` or `0x3(%r13)`.
# So the table is just data, and the index changes.
