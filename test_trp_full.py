import ast
from Crypto.Util.number import long_to_bytes

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
ct_full = bytes.fromhex(data['cipher']['ct'])

p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
tr_x = 14143528059618230756795996081882139144
tr_y = 30966807611185687890035126080071309054
T = (tr_x, tr_y)

def add(P1, P2):
    if P1[0] == P2[0] and P1[1] == P2[1]:
        num = (3 * P1[0]**2 + a) % p
        den = (2 * P1[1]) % p
    else:
        num = (P2[1] - P1[1]) % p
        den = (P2[0] - P1[0]) % p
    lam = (num * pow(den, p-2, p)) % p
    x3 = (lam**2 - P1[0] - P2[0]) % p
    y3 = (lam * (P1[0] - x3) - P1[1]) % p
    return (x3, y3)

W0 = T
W1 = add(W0, T)

ks = long_to_bytes(W0[0], 16) + long_to_bytes(W0[1], 16) + long_to_bytes(W1[0], 16) + long_to_bytes(W1[1], 16)
pt = bytes([c ^ k for c, k in zip(ct_full, ks)])

print("PT (hex):", pt.hex())
