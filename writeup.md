# Writeup: Extended Illusion (Crypto CTF)

## Overview
We are given an elliptic curve challenge where the oracle claims to perform standard elliptic-curve operations. We can query the oracle to retrieve points and are tasked with submitting the correct secret scalar $k$. The curve is defined by $y^2 = x^3 + a x + b \pmod{p}$, where $p$ is a 128-bit prime. The server provides parameters including a 256-bit number $N$ and a 55-bit integer $H$.

## Step 1: Initial Investigation
Connecting to the service using `nc exp.cybergame.sk 7009` yields the following banner:
```
   == Extended Illusion ==
Curve: y^2 = x^3 + a*x + b (mod p)

p = 0xfffffffdffffffffffffffffffffffff
a = 0xfffffffdfffffffffffffffffffffffc
b = 0xe87579c11079f43dd824993c2cee5ed3
N = 0xfffffffc00000003ffffffffffffffffc9f18e2b1c66c5082fb421d381749447
H = 46867957373857787

Menu:
  1) query point for ecc
  2) submit the right k
```

We notice a few interesting properties:
1. $p$ is a 128-bit prime.
2. $N$ is 256 bits, which is exactly $O(p^2)$. This strongly hints the curve operations might be on an extension field $F_{p^2}$.
3. $H$ is a very specific 55-bit number provided explicitly.

When we query a point (Option 1), the server prompts for an `X` coordinate. Providing an integer gives a 128-character hexadecimal string representing the resulting point (64 bytes). This means the point consists of two 32-byte coordinates $(X, Y)$, confirming operations on an extension field.

## Step 2: Group Order and Twist Curve
The order of an elliptic curve $E/F_p$ is $n_2 = p + 1 + t$ for some trace $t$, and the order of its quadratic twist $E'/F_p$ is $n_1 = p + 1 - t$.
The number of points on the curve over $F_{p^2}$ is exactly given by $N = n_1 \cdot n_2$.

By checking $t^2 = (p+1)^2 - N$, we deduce:
$$ t = 8476633335676313877 $$
This allows us to calculate $n_1$ and $n_2$:
- $n_1 = 340282366762482138426369298909003996907$
- $n_2 = 340282366762482138443322565580356624661$

Upon inspecting $H$, we find that $H$ smoothly divides the twist curve order $n_1$:
- $n_1 \equiv 0 \pmod{H}$
- $H = 41 \times 12583759 \times 90840973$

Because $H$ is completely smooth, solving the Discrete Logarithm Problem (DLP) modulo $H$ using the Pohlig-Hellman algorithm is trivial. Furthermore, because $k$ is randomized per connection and $k < H$, finding $k \pmod{H}$ will yield the exact value of $k$.

## Step 3: Utilizing the Quadratic Twist
The server maps our chosen $X$ to a point $P$. It computes $y^2 = X^3 + aX + b \pmod{p}$.
- If $y^2$ is a quadratic residue modulo $p$, the resulting point $P$ lies on the base curve $E(F_p)$.
- If $y^2$ is a quadratic non-residue, the point lies on the quadratic twist $E'(F_p)$.

To attack the problem and leverage the smooth subgroup $H$, we must force the server to pick a point on the twist curve.
We check the Legendre symbol of $X^3 + aX + b \pmod{p}$. For $X = 1$, the symbol is $-1$, meaning the point lies on the twist curve.

## Step 4: Isomorphism Mapping
The server evaluates operations over $F_{p^2}$ with $F_p[u]/(u^2 + 1)$. A point on the twist has coordinates $(X, y \cdot u)$.
The standard representation of a quadratic twist over $F_p$ using the non-residue $c = -1$ is given by:
$$ Y^2 = X^3 + a c^2 X + b c^3 \implies Y^2 = X^3 + a X - b $$
The isomorphism from the server's coordinates $(X_{server}, Y_{server} \cdot u)$ to the standard twist curve $(x', y')$ is:
$$ x' = -X_{server} \pmod{p} $$
$$ y' = Y_{server} $$

By supplying $X=1$ to the server, we parse the 64-byte response to extract $X_{server}$ and $Y_{server}$, then map them to the standard twist $y^2 = x^3 + a x - b$.

## Step 5: Solving the DLP
Once we mapped both the base point $P$ and the server's response $Q = k \cdot P$ to the twist curve, we project them down to the subgroup of order $H$:
$$ q = n_1 / H $$
$$ P_{sub} = q \cdot P $$
$$ Q_{sub} = q \cdot Q $$

We implement a Baby-step Giant-step algorithm alongside the Pohlig-Hellman algorithm for the prime factors of $H$.
```python
factors = {41: 1, 12583759: 1, 90840973: 1}
k = pohlig_hellman(P_sub, Q_sub, H, factors)
```
If the server chose the negative $Y$-root during generation, our $Q_{sub}$ might be $-k \cdot P_{sub}$. We simply try both $Q_{sub}$ and $-Q_{sub}$. Once $k$ is found, we submit it via Option 2.

## Step 6: Flag
Running the exploit successfully recovers $k$, which the server accepts and prints the flag:
`SK-CERT{0p3r4t10n5_0v3r_qu4dr4t1c_f13ld5_4r3_54f3r}`
