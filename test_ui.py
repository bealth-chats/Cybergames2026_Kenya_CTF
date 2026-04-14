import ast
from Crypto.Util.number import long_to_bytes

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
ct_full = bytes.fromhex(data['cipher']['ct'])

p = 240216054091197400064972999812429686881
S = 83565353590433210172898439398683101684443244628510805561375127222301934638168496

u0 = S % p
u1 = (S // p) % p
u2 = (S // (p**2)) % p
u3 = (S // (p**3)) % p

ks = long_to_bytes(u0, 16) + long_to_bytes(u1, 16) + long_to_bytes(u2, 16) + long_to_bytes(u3, 16)
pt = bytes([c ^ k for c, k in zip(ct_full, ks)])

print("PT (u0, u1, u2, u3):", pt)
if b'SK-CERT' in pt: print("FOUND!")
