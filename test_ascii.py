p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
upper = 0x76126ce276dc5c53 * (2**64)

ct_8_16 = bytes.fromhex('2443ae04c0a8f8bf')

valid_points = []
# There are 2^64 possibilities. We can't loop 2^64.
# But we only want ASCII!
# ASCII characters are 32 to 126.
# So each byte of x_lower must be within ct_8_16[i] ^ ASCII
# ct_8_16 is: 24 43 ae 04 c0 a8 f8 bf
# This gives exactly 95^8 possibilities!
# 95^8 is 6.6 * 10^15. Still too big for python loop.
