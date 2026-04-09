# Let's read the disassembly!
# "trace how the two registers combine to generate each output byte and you're at the flag."
# In 2e10 (which generates the output byte):
# 2ea1: lea (%r15,%r12,1), %eax
# 2ea5: add $0x1f123, %eax
# 2eaa: and $0xffffff, %eax
# 2eaf: mov %r14d, %ecx
# 2eb2: shl $0x4, %ecx
# 2eb5: add %r14d, %ecx
# 2eb8: xor %r12d, %ecx
# 2ebb: and $0xffffff, %ecx
# 2ec1: xor $0xaa33cc, %rcx
# 2ec8: imul $0x83, %ebx, %edx
# 2ece: add %r12d, %edx
# 2ed1: add $0x2d8f1, %edx
# 2ed7: and $0xffffff, %edx
# 2edd: lea 0x10213c(%rip), %r14
# 2ee4: movzbl (%r14,%rax,1), %edi
# 2ee9: movzbl (%r14,%rcx,1), %ebp
# 2eee: movzbl (%r14,%rdx,1), %r15d
# ... wait, it generates %edi, %ebp, %r15d from .rodata.
# Then:
# 2ef8: call 3090 (rotate left %edi by %cl (which is %esi))
# 2f0b: call 3090 (rotate left %ebp by %esi)
# 2f14: xor (%r14,%r13,1), %r12b
# 2f18: xor 0x7(%rsp), %r12b
# 2f1d: xor %al, %r12b
# 2f20: xor %r15b, %r12b
# 2f2b: or %ebx, %r15d
# 2f32: call 30e0 (hash/mul by 0x5d)
# 2f39: mov %ebx, %edi
# 2f3b: mov $0x5, %esi
# 2f40: call 3090
# 2f45: xor %bpl, %al
# 2f48: add $0x8, %rsp

# How do they combine?
# %r15d and %ebp and %edi are the bytes from .rodata.
# Wait! "the flag literally spells out the two key components once you know what to look for."
# Look at the XOR operations:
# xor (%r14,%r13,1), %r12b
# xor 0x7(%rsp), %r12b
# xor %al, %r12b
# xor %r15b, %r12b

# What are the two key components being combined?
# The 1MB lookup table is used three times!
