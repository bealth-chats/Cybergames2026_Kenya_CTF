ct = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')
c0_x = int.from_bytes(ct[:16], 'big')
c32_x = int.from_bytes(ct[32:48], 'big')
p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
tr_x = 14143528059618230756795996081882139144
tr_y = 30966807611185687890035126080071309054

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

c0_y2 = (pow(c0_x, 3, p) + a * c0_x) % p
c0_y = tonelli(c0_y2)

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

T = (tr_x, tr_y)

for sign in [1, -1]:
    C0 = (c0_x, (c0_y * sign) % p)
    C1 = add(C0, T)
    print(f"Sign {sign} -> C1_x == c32_x?", C1[0] == c32_x)
