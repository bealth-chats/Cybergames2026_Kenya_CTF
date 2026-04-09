with open('beacon', 'rb') as f:
    f.seek(0x5000 + (0x1105260 - 0x1105000))
    data = f.read(32)
print([hex(c) for c in data])

# wait, we found the bytes:
# c5 23 d9 a0 b5 67 1f 65 af fb 42 47 18 18 36 52
# Let's write the LCG generator and see if we can XOR it to get "SK-CERT{"
