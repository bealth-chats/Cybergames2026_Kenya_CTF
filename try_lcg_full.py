# In 2a40:
# imul $0x6d, %ebx, %ebx
# add $0x3d, %ebx
# movzwl %bx, %r14d
# shr $0x7, %r14d
# So the value is (ebx & 0xffff) >> 7.
# Then this value is XORed with the coupling table?
# No!
# 2a6c: lea 0x11027ed(%rip), %rcx
# 2a73: movzbl (%rdx,%rcx,1), %ecx
# 2a77: movzbl %al, %eax
# 2a7a: xor %r14d, %eax
# 2a7d: xor %ebx, %eax
# Wait!
# The output is `eax = al ^ r14d ^ ebx`?
# And where is the table XORed?
# "The LFSR initialises 16 nibbles via a simple LCG (multiply by 0x6d, add 0x3d) XOR'd with a coupling table"
# Let's consider: if the flag is 16 bytes long, and the coupling table is 16 bytes:
# coupling_table = [0xc5, 0x23, 0xd9, 0xa0, 0xb5, 0x67, 0x1f, 0x65, 0xaf, 0xfb, 0x42, 0x47, 0x18, 0x18, 0x36, 0x52]
# And the flag is "SK-CERT{...}" (16 chars?)
# SK-CERT{ is 8 chars. So the content is 7 chars + }.
# Wait, "the flag literally spells out the two key components once you know what to look for."
# LFSR_NFSR is 9 chars. Total 17 chars.
# "SK-CERT{LFSR_NFSR}" is 18 chars.
# Maybe the coupling table is 18 bytes? Let's read 18 bytes!
