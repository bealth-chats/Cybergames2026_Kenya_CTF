p = 0xfffffffdffffffffffffffffffffffff
a = 0xfffffffdfffffffffffffffffffffffc
b = 0xe87579c11079f43dd824993c2cee5ed3
F = GF(p)
R.<x> = PolynomialRing(F)
f = x^3 + a*x + b
print(f.roots())
