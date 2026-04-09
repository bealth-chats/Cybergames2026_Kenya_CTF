# The 72 bytes output by the cipher with seed 0:
import binascii

data = binascii.unhexlify("5cfe40b36d5d0c6872e2c9628236726bc06bbf82a23dd473fca5903f46181243b2af472194725d6ec1b31b1deccb83e684f6136493b2995cfe8384c7b8c198a58112513a096997b8")
# "The flag literally spells out the two key components once you know what to look for."
# Wait, look at the ASCII output of these 72 bytes!
for x in data:
    if 32 <= x <= 126:
        print(chr(x), end="")
    else:
        print(".", end="")
print()

# "trace how the two registers combine to generate each output byte and you're at the flag."
# Wait! "trace how the two registers combine to generate each output byte and you're at the flag."
# In 2e10 (which is the output function), what is the exact XOR operation?
# The two registers combine:
# 2f18: xor 0x7(%rsp), %r12b
# 2f1d: xor %al, %r12b
# 2f20: xor %r15b, %r12b
# 2f45: xor %bpl, %al
# Where are the bytes from the two registers coming from?
