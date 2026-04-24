# Wait! In `parse_curve51.py` and `test_ecc10.py` we established that the twist curve point derived from X was:
# x_twist = -X.
# Because the isomorphism is Y = y * sqrt(-1), X_new = -X.
# Let's fix that!
import socket
import time
import math
from sympy.ntheory.modular import crt

p = 0xfffffffdffffffffffffffffffffffff
a = 0xfffffffdfffffffffffffffffffffffc
b = 0xe87579c11079f43dd824993c2cee5ed3

class MyPoint:
    def __init__(self, x, y, p, a):
        self.x = x
        self.y = y
        self.p = p
        self.a = a
        self.is_inf = (x is None)

    def __eq__(self, other):
        if self.is_inf and other.is_inf: return True
        if self.is_inf or other.is_inf: return False
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))

    def __add__(self, other):
        if self.is_inf: return other
        if other.is_inf: return self
        if self.x == other.x and self.y != other.y:
            return MyPoint(None, None, self.p, self.a)
        if self.x == other.x and self.y == other.y:
            if self.y == 0: return MyPoint(None, None, self.p, self.a)
            m = (3*self.x**2 + self.a) * pow(2*self.y, self.p-2, self.p) % self.p
        else:
            m = (other.y - self.y) * pow(other.x - self.x, self.p-2, self.p) % self.p

        x3 = (m**2 - self.x - other.x) % self.p
        y3 = (m*(self.x - x3) - self.y) % self.p
        return MyPoint(x3, y3, self.p, self.a)

    def __mul__(self, k):
        R = MyPoint(None, None, self.p, self.a)
        S = self
        while k:
            if k & 1: R = R + S
            S = S + S
            k >>= 1
        return R

    def __rmul__(self, k):
        return self.__mul__(k)

t = 8476633335676313877
n1 = p + 1 - t
H = 46867957373857787
q = n1 // H
factors = {41: 1, 12583759: 1, 90840973: 1}

def bsgs(G, Y, order):
    m = math.ceil(math.sqrt(order))
    lookup = {}
    S = MyPoint(None, None, p, a)
    for j in range(m):
        lookup[S] = j
        S = S + G

    mG = m * G
    mG_inv = MyPoint(mG.x, (-mG.y) % p, p, a) if not mG.is_inf else mG

    T = Y
    for i in range(m):
        if T in lookup:
            return (i * m + lookup[T]) % order
        T = T + mG_inv
    return None

def pohlig_hellman(G, Y, order, factors):
    rems = []
    mods = []
    for r, e in factors.items():
        pe = r**e
        G_r = (order // pe) * G
        Y_r = (order // pe) * Y
        k_r = bsgs(G_r, Y_r, pe)
        if k_r is None: return None
        rems.append(k_r)
        mods.append(pe)
    return crt(mods, rems)[0]

def solve():
    s = socket.socket()
    s.settimeout(5)
    s.connect(("exp.cybergame.sk", 7009))
    print("Connected")
    s.recv(4096)

    X = 1

    s.sendall(b"1\n")
    time.sleep(0.5)
    s.recv(4096)
    s.sendall(str(X).encode() + b"\n")
    time.sleep(0.5)
    resp = s.recv(4096).decode()

    import re
    match = re.search(r"resp = ([0-9a-f]+)", resp)
    hx = match.group(1)

    xA = int(hx[:32], 16)
    yB = int(hx[96:128], 16)

    # Isomorphism: X_twist = -X_orig
    twist_a = a
    twist_b = (-b)%p

    # Q from server:
    Q = MyPoint((-xA)%p, yB, p, twist_a)

    # P derived from X
    y_sq = (X**3 + twist_a*X + twist_b) % p
    # Wait, the server computes y^2 = X^3 + aX + b. Since it's a non-residue, it uses F_p^2.
    # We found that X_twist = -X_orig !
    rhs = (X**3 + a*X + b) % p
    y = pow(-rhs, (p+1)//4, p)
    P = MyPoint((-X)%p, y, p, twist_a)

    P_sub = q * P
    Q_sub = q * Q

    k = pohlig_hellman(P_sub, Q_sub, H, factors)
    if k is None:
        Q_sub_neg = MyPoint(Q_sub.x, (-Q_sub.y)%p, p, twist_a)
        k = pohlig_hellman(P_sub, Q_sub_neg, H, factors)
        if k is not None:
            k = (-k) % H

    print("Found k mod H:", k)
    if k is not None:
        s.sendall(b"2\n")
        time.sleep(0.5)
        s.recv(4096)
        s.sendall(str(k).encode() + b"\n")
        time.sleep(0.5)
        print("Flag:", s.recv(4096).decode())

solve()
