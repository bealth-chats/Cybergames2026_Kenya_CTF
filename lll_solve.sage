p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
Tr_x = 14143528059618230756795996081882139144
Tr_y = 30966807611185687890035126080071309054

ct = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')

# Let K0 = (x0, y0), K1 = (x1, y1)
# K1 = K0 + T
# x1 = ((y0 - Tr_y)/(x0 - Tr_x))^2 - x0 - Tr_x  (mod p)

# We know approximations:
# x0 ~ C0x, y0 ~ C0y
# x1 ~ C1x, y1 ~ C1y

# Let's just bruteforce the 8 bytes of x0!
# Wait, 8 bytes is 2^64. We can't brute force 2^64.
# But x0_bytes[8:16] ^ C0x_bytes[8:16] must be ASCII (32 to 126).
# 95^8 = 6.6 * 10^15. Still too big.
