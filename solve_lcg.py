data = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52, 0xdd, 0x68, 0x63, 0x55, 0x2e, 0x3e, 0x48, 0xf4, 0xc3, 0x28, 0xa3, 0x75, 0xfc, 0xc7, 0x23, 0x48]
target = b"SK-CERT{"

# The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table
# Wait, "initialises 16 nibbles via a simple LCG ... XOR'd with a coupling table"
# What if the 16 nibbles ARE the flag? No, nibbles are 4 bits. 16 nibbles = 8 bytes.
# 8 bytes is exactly "SK-CERT{" ?
# No, "SK-CERT{" is 8 bytes!
# So 16 nibbles = 8 bytes.
# Does the flag end there? No, the rest of the flag is generated somehow?
# "the flag literally spells out the two key components once you know what to look for."
# Wait, "the flag literally spells out the two key components" means the flag IS the two key components!
# SK-CERT{...}
