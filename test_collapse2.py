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

for sign in [1, -1]:
    W0 = (x0, (y0 * sign) % p)
    W1 = add(W0, T)
    W2 = add(W1, T)
    W3 = add(W2, T)
    W4 = add(W3, T)

    # Try high 8 bytes of x and y
    ks1 = b''
    for W in [W0, W1, W2, W3, W4, add(W4, T), add(add(W4,T),T), add(add(add(W4,T),T),T)]:
        ks1 += long_to_bytes(W[0], 16)[:8]

    pt1 = bytes([c ^ k for c, k in zip(ct_full, ks1)])
    if all(32 <= b <= 126 for b in pt1[8:16]):
        print(f"Sign {sign} High X PT:", pt1)

    ks2 = b''
    for W in [W0, W1, W2, W3]:
        ks2 += long_to_bytes(W[0], 16)[:8] + long_to_bytes(W[1], 16)[:8]

    pt2 = bytes([c ^ k for c, k in zip(ct_full, ks2)])
    if all(32 <= b <= 126 for b in pt2[8:16]):
        print(f"Sign {sign} High X High Y PT:", pt2)

    ks3 = b''
    for W in [W0, W1, W2, W3, W4, add(W4, T), add(add(W4,T),T), add(add(add(W4,T),T),T)]:
        ks3 += long_to_bytes(W[0], 16)[8:]
    pt3 = bytes([c ^ k for c, k in zip(ct_full, ks3)])
    if all(32 <= b <= 126 for b in pt3[8:16]):
        print(f"Sign {sign} Low X PT:", pt3)
