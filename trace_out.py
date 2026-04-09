# Let's look at how the 72 bytes are generated!
# It loops 72 times (0x47 + 1).
# 1dd0: movzbl (%rbx,%r12,1), %edi
# 1dd5: xor %ebp, %edi
# 1dd7: mov %r12d, %edx
# 1dda: and $0xf, %edx
# 1ddd: lea (%r14,%r12,1), %esi
# 1de1: call 1e50
# 1de6: xor %eax, %ebp
# 1de8: mov %ebp, %eax
# 1dea: shr $0x10, %eax
# 1ded: xor %ebp, %eax
# 1def: movzwl %ax, %edi
# 1df2: call 30e0
# 1df7: movzbl %al, %eax
# 1dfa: xor %al, (%rbx,%r12,1)
# 1dfe: add %r15d, %ebp
# 1e01: add %eax, %ebp
# 1e03: mov %r12d, %esi
# 1e06: and $0x7, %esi
# 1e09: add $0x5, %esi
# 1e0c: mov %ebp, %edi
# 1e0e: call 1fb0
# 1e13: mov %eax, %ebp

# Look at 1dfa: xor %al, (%rbx,%r12,1)
# The output is XORed with what was already in (%rbx,%r12,1) !
# Wait! (%rbx,%r12,1) is the BUFFER!
# And what was in the buffer BEFORE the loop?
# In main (1253..129a):
# The buffer is filled with 0x48 bytes copied from 0xe2(%rsp).
# Let's find what is at 0xe2(%rsp)!
