import ast
from Crypto.Cipher import AES
from Crypto.Util.number import long_to_bytes
import hashlib

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
nonce = bytes.fromhex(data['cipher']['nonce'])
ct_full = bytes.fromhex(data['cipher']['ct'])
ct = ct_full[:-16]
tag = ct_full[-16:]

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

def test_key(key):
    try:
        cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
        pt = cipher.decrypt_and_verify(ct, tag)
        print("Found with GCM! PT:", pt)
        return True
    except Exception as e:
        return False

for sign in [1, -1]:
    W0 = (x0, (y0 * sign) % p)
    key = long_to_bytes(W0[0], 16) + long_to_bytes(W0[1], 16)
    if test_key(key): print("Key was W0")
    if test_key(hashlib.sha256(key).digest()): print("Key was SHA256(W0)")

    # Also try little endian
    key2 = W0[0].to_bytes(16, 'little') + W0[1].to_bytes(16, 'little')
    if test_key(key2): print("Key was W0 little")
