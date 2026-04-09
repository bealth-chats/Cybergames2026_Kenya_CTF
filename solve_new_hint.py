# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# "and the NFSR does a nonlinear feedback step using that same table, they feed into each other which is the 'state coupling' part."
# "The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions."
# "You've got it, just trace how the two registers combine to generate each output byte and you're at the flag."

# We need to trace how the two registers combine to generate each output byte.
# The output is 0x48 (72) bytes.
# If we run the cipher with 0 seeds, we got:
# 5cfe40b36d5d0c6872e2c9628236726bc06bbf82a23dd473fca5903f46181243b2af472194725d6ec1b31b1deccb83e684f6136493b2995cfe8384c7b8c198a58112513a096997b8
# Wait, "the flag literally spells out the two key components once you know what to look for."
# Wait, "the flag literally spells out the two key components once you know what to look for."
# Does the *output byte sequence* itself spell out the flag?
# But if it does, it's not ASCII string! It's hex: `5c fe 40 b3 ...`
# Let me decode the output bytes with some other key?
# Wait! "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# The LCG step uses `0x6d` and `0x3d`.
# What if the generated 72 bytes ARE the encrypted flag?
# The binary generates the output bytes and XORs them with something? No, it just generates them.
# If it's a cipher, maybe the flag is ENCRYPTED with this cipher, and the output we got IS the encrypted flag!
# NO, the binary outputs 72 bytes. The flag is SK-CERT{...}.
