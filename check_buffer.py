# Let's trace where 0xe2(%rsp) is initialized!
# It comes from 0x122(%rsp) ? No, 0x122 goes to 0x40(%rsp).
# 0xe2(%rsp) to 0x121(%rsp) are copied.
# How are they initialized?
# In 11e2: sub $0x168, %rsp
# Then 120a: lea 0x4c(%rsp), %rdi; call 1730
# Then 1219: lea 0x19(%rip), %rax
# 1220: lea 0x2c(%rip), %rcx
# 122b: cmpl $0, 0x160(%rsp)
# 1237: jmp *%rcx
# If 0x160(%rsp) is 0, jumps to %rax = 1239
# 124c: call 19c0.
# Then 1251: jmp 1293! Wait, if it jumps to 1293, it SKIPS the copying from 0xe2(%rsp)!
# And what does 19c0 do?
# It populates (%rsp)!
