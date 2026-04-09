import sys

# The 18 function pointers evaluate to exactly 18 numbers.
# We wrote a python script to simulate them.
# For i=0..15, they output 16 numbers.
# What about the last 2 functions? 0x4090 and 0x40e0.
# They do:
# 4090:
# mov 0x1103176(%rip), %eax  # eax = 0x20001
# lea 1(%rax), %r9d        # r9d = 0x20002
# imul %eax, %r9d          # r9d *= 0x20001
# test $1, %r9b            # test if odd
# (it's even, jumps over)
# push %rax                # push 0x20001? Wait!
# xor %eax, %eax
# add $0x4d455247, %eax    # "MERG"? No, 0x4d455247 = 'M', 'E', 'R', 'G' -> "GREM"
# ... wait, that's in 2d70, the shared function.

# Let's trace 2d70!
# 2d70 is called by 4090 and 40e0.
# In 4090:
# e9 9b ec ff ff  -> jmp 2d70
# Wait! 2d70 expects arguments in %edi, %esi, %edx, %ecx, %r8 !
# Where do these arguments come from?
# They come from the caller of 4090!
# Who calls 4090?
