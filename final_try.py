p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
tr_x = 14143528059618230756795996081882139144
tr_y = 30966807611185687890035126080071309054
T = (tr_x, tr_y)

ct_full = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')

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

# Let's try what if W_0 is derived from T by scalar multiplication?
def point_mul(P, k):
    res = None; base = P
    while k > 0:
        if k % 2 == 1: res = add(res, base) if res else base
        base = add(base, base) if base else None
        k //= 2
    return res

import ast
S = 83565353590433210172898439398683101684443244628510805561375127222301934638168496
M = 125246593209923507420451572144950406289778641980713308781872871402469735811132439

u0 = 0x4ea54f94fa1c2723c392854070296e2c
u1 = 0x2051dc40cefa340a3651d3f10f35455c
u2 = 0x5a8

for k in [u0, u1, u2, S % p, M % p]:
    P = point_mul(T, k)
    if P and hex(P[0]).startswith('0x7612'):
        print("Found matching prefix with scalar", hex(k))
