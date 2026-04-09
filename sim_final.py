# Let's consider 2f14: `xor (%r14,%r13,1), %r12b`
# %r14 is the S-box pointer. %r13 is the index into it!
# Wait! How is %r13 generated?
# 2e83: imul $0x4a7c15, %ebx, %r12d
# 2e8a: xor %ebp, %r12d
# 2e8d: xor %eax, %r12d
# 2e90: mov %r12d, %r13d
# 2e93: and $0xffffff, %r13d
# So the index into the S-box is `(ebx * 0x4a7c15 ^ ebp ^ eax) & 0xffffff`.
# Wait, this evaluates ONE byte from the S-box!
# And what else does it XOR?
# `xor 0x7(%rsp), %r12b` (Wait, what is at 0x7(%rsp)?)
# 2efd: mov %al, 0x7(%rsp) (The result of `call 3090`, which is the first S-box byte rotated)
# Wait, let's trace ALL S-box reads:
# 2ee4: movzbl (%r14,%rax,1), %edi
# 2ee9: movzbl (%r14,%rcx,1), %ebp
# 2eee: movzbl (%r14,%rdx,1), %r15d
# 2ef8: call 3090
# 2efd: mov %al, 0x7(%rsp)
# 2f0b: call 3090
# 2f14: xor (%r14,%r13,1), %r12b  <- The 4th S-box byte!
# 2f18: xor 0x7(%rsp), %r12b      <- The 1st S-box byte rotated!
# 2f1d: xor %al, %r12b            <- The 2nd S-box byte rotated!
# 2f20: xor %r15b, %r12b          <- The 3rd S-box byte!
#
# Wait, so the final output byte is formed by XORing 4 bytes from the S-box (with some rotations).
# Let's think about "the two key components" that "the flag literally spells out".
# "the two key components":
# LCG and SBOX?
# SBOX and LCG?
# What about "LFSR" and "NFSR"? The hint says:
# "The LFSR initialises 16 nibbles... and the NFSR does a nonlinear feedback... they feed into each other which is the 'state coupling' part. The filter/output function is where the 1MB S-box comes in instead of Grain's standard boolean functions. You've got it, just trace how the two registers combine to generate each output byte and you're at the flag."
# "the flag literally spells out the two key components once you know what to look for."
# Wait, "how the two registers combine... and you're at the flag"
# The two registers combine by XORing them? Or do they form the flag?
