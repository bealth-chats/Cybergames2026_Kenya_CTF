# Let's write a python script to simulate the LCG.
# In 2a40:
# imul $0x6d, %ebx, %ebx
# add $0x3d, %ebx
# movzwl %bx, %r14d
# shr $0x7, %r14d
# lea -0x45(%r13), %ecx
# lea 0x3(%r13), %edx
# cmp $0xa, %r12
# cmovae %ecx, %edx
# movzbl (%rdx,%rcx), ... wait, the base is 1105260.
# The offset is %edx.

# This means the table is not just 16 bytes!
# %r13 comes from %edx of the caller.
# The caller to 2a40 is `1e50`.
