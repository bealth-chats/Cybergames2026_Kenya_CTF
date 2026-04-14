import ast
from sympy.ntheory.modular import crt

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
ms = [int(l['m']) for l in data['leakage']]
ss = [int(l['s']) for l in data['leakage']]
S, M = crt(ms, ss)

p = 240216054091197400064972999812429686881
coeffs = []
temp = S
while temp > 0:
    coeffs.append(temp % p)
    temp //= p

c0 = coeffs[0]
c1 = coeffs[1]
c2 = coeffs[2]
print(f"c0 = {c0}")
print(f"c1 = {c1}")
print(f"c2 = {c2}")
