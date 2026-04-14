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
x0 = 0x76126ce276dc5c53237120d290400a08

def tonelli(n):
    Q = p - 1; S = 0
    while Q % 2 == 0: Q //= 2; S += 1
    import random
    random.seed(123)
    while True:
        z = random.randint(2, p-1)
        if pow(z, (p-1)//2, p) == p-1: break
    M = S; c_val = pow(z, Q, p); t = pow(n, Q, p); R = pow(n, (Q+1)//2, p)
    while True:
        if t == 1: return R
        t2i = t; i = 0
        for i in range(1, M):
            t2i = (t2i**2) % p
            if t2i == 1: break
        b = pow(c_val, 1 << (M-i-1), p)
        M = i; c_val = (b**2) % p; t = (t * c_val) % p; R = (R * b) % p

y0 = tonelli((pow(x0, 3, p) + a*x0) % p)

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

import string
import itertools

for sign in [1, -1]:
    W0 = (x0, (y0 * sign) % p)
    W1 = add(W0, T)

    ks = long_to_bytes(W0[0], 16) + long_to_bytes(W0[1], 16) + long_to_bytes(W1[0], 16) + long_to_bytes(W1[1], 16)
    pt = bytes([c ^ k for c, k in zip(ct_full, ks)])
    print(f"--- Sign {sign} ---")

    # Try XORing the rest with something else?
    # What if the user generated W0, W1 but then the ciphertext is AES encrypted with Key = SHA256(PT_RAW)?
    # No, that makes no sense.

    # Let's print the actual PT, maybe we can decode it differently
    print("PT:", pt)
