p = 240216054091197400064972999812429686881
Fp = GF(p)
c = Fp(41857999666904709325391374420372856847)
a = Fp(202528927977825293762893890130927217592)

print("Curve parameters:")
print("p =", p)
print("p is prime:", is_prime(p))

E = EllipticCurve(Fp, [a, 0])
print("E order:", E.order())
print("Is supersingular?", E.is_supersingular())
