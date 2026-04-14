p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
ct = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')

# The first 8 bytes of x0 are known exactly:
x0_high = 0x76126ce276dc5c53
# The next 8 bytes of x0 are unknown, but they are C0x[8:16] ^ ASCII
C0x_low = int.from_bytes(ct[8:16], 'big')
# The 16 bytes of y0 are unknown, but they are C0y ^ ASCII
C0y = int.from_bytes(ct[16:32], 'big')

# Let's formulate this as a hidden number problem using LLL
# Or we can just use Sage's roots() if we guess the 8 unknown bytes of x0!
# Wait! There are 8 bytes of x0 unknown!
# 8 bytes is 64 bits. Still too big to brute force (2^64).
# BUT the ASCII constraint means each byte has 95 possibilities.
# 95^8 = 6.6 * 10^15.

# However, y0 is ALSO constrained!
# y0 = C0y ^ ASCII. This means y0 ~ C0y.
# y0^2 = x0^3 + a*x0 mod p
