import sys

# What is the state coupling structure?
# LFSR bits feed into the NFSR.
# Specifically, in Grain-128a, the NFSR is updated with:
# b_{i+128} = s_i + b_i + f(b) ...
# So the two key components of the update are the linear part (s_i + b_i) and the nonlinear part f(b).
# Or maybe the two components are LFSR and NLFSR.
# What if it's "SK-CERT{LFSR_NLFSR}"?
# I already suggested it but let me verify.
# What are the two key components of what we found?
# We found 16 tap indices:
# 17, 29, 45, 59, 79, 92, 103, 121
# 131, 157, 167, 179, 197, 217, 225, 247
# Look at these numbers!
# 17, 29, 45, 59, 79, 92, 103, 121
# 3, 29, 39, 51, 69, 89, 97, 119  (subtracted 128)

# Let's map these numbers to letters (A=1, B=2, C=3...)
def to_char(x):
    if x <= 26: return chr(x + 64)
    return '?'

print("NFSR:", [to_char(x) for x in [17, 29, 45, 59, 79, 92, 103, 121]])
print("LFSR:", [to_char(x) for x in [3, 29, 39, 51, 69, 89, 97, 119]])
