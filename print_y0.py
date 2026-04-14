p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592
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
y1 = (p - y0) % p

print("y0:", hex(y0), "even?", y0 % 2 == 0)
print("y1:", hex(y1), "even?", y1 % 2 == 0)
