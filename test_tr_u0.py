p = 240216054091197400064972999812429686881
c = 41857999666904709325391374420372856847
a = 202528927977825293762893890130927217592
u0 = 0x4ea54f94fa1c2723c392854070296e2c
u1 = 0x2051dc40cefa340a3651d3f10f35455c
u2 = 0x5a8

class Fp4:
    def __init__(self, c0, c1, c2, c3):
        self.c0 = c0 % p; self.c1 = c1 % p; self.c2 = c2 % p; self.c3 = c3 % p
    def __add__(self, other): return Fp4(self.c0 + other.c0, self.c1 + other.c1, self.c2 + other.c2, self.c3 + other.c3)
    def __sub__(self, other): return Fp4(self.c0 - other.c0, self.c1 - other.c1, self.c2 - other.c2, self.c3 - other.c3)
    def __mul__(self, other):
        r0 = (self.c0*other.c0 + c*(self.c1*other.c3 + self.c2*other.c2 + self.c3*other.c1)) % p
        r1 = (self.c0*other.c1 + self.c1*other.c0 + c*(self.c2*other.c3 + self.c3*other.c2)) % p
        r2 = (self.c0*other.c2 + self.c1*other.c1 + self.c2*other.c0 + c*(self.c3*other.c3)) % p
        r3 = (self.c0*other.c3 + self.c1*other.c2 + self.c2*other.c1 + self.c3*other.c0) % p
        return Fp4(r0, r1, r2, r3)
    def __pow__(self, exp):
        res = Fp4(1, 0, 0, 0)
        base = self
        while exp > 0:
            if exp % 2 == 1: res = res * base
            base = base * base
            exp //= 2
        return res
    def __eq__(self, other): return self.c0 == other.c0 and self.c1 == other.c1 and self.c2 == other.c2 and self.c3 == other.c3

ZERO = Fp4(0, 0, 0, 0)

def add_points(P1, P2):
    if P1 is None: return P2
    if P2 is None: return P1
    if P1[0] == P2[0] and P1[1] == P2[1]:
        num = P1[0] * P1[0] * Fp4(3,0,0,0) + Fp4(a,0,0,0)
        den = P1[1] * Fp4(2,0,0,0)
    elif P1[0] == P2[0]: return None
    else:
        num = P2[1] - P1[1]
        den = P2[0] - P1[0]
    lam = num * (den**((p**4)-2))
    x3 = lam * lam - P1[0] - P2[0]
    y3 = lam * (P1[0] - x3) - P1[1]
    return (x3, y3)

def point_mul(P, k):
    res = None; base = P
    while k > 0:
        if k % 2 == 1: res = add_points(res, base)
        base = add_points(base, base)
        k //= 2
    return res

px = Fp4(u0, u1, u2, 0)
y2 = px * px * px + Fp4(a, 0, 0, 0) * px
Q = p**4 - 1; S = 0
while Q % 2 == 0: Q //= 2; S += 1
import random
random.seed(123)
while True:
    z = Fp4(random.randint(0, p-1), random.randint(0, p-1), random.randint(0, p-1), random.randint(0, p-1))
    if z**((p**4 - 1)//2) != Fp4(1,0,0,0) and z**((p**4 - 1)//2) != Fp4(0,0,0,0): break
M = S; c_val = z**Q; t = y2**Q; R = y2**((Q + 1) // 2)
while True:
    if t == Fp4(1,0,0,0): break
    t2i = t; i = 0
    for i in range(1, M):
        t2i = t2i**2
        if t2i == Fp4(1,0,0,0): break
    b = c_val**(2**(M - i - 1))
    M = i; c_val = b**2; t = t * c_val; R = R * b
py = R
P = (px, py)

def compute_trace(Q):
    T1 = add_points(Q, (Q[0]**p, Q[1]**p))
    T2 = add_points(T1, (Q[0]**(p**2), Q[1]**(p**2)))
    Tr = add_points(T2, (Q[0]**(p**3), Q[1]**(p**3)))
    return Tr[0].c0

print("Tr(u0*P) x:", hex(compute_trace(point_mul(P, u0))))
print("Tr(u1*P) x:", hex(compute_trace(point_mul(P, u1))))
print("Tr(u2*P) x:", hex(compute_trace(point_mul(P, u2))))
