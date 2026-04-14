p = 240216054091197400064972999812429686881
u0 = 0x4ea54f94fa1c2723c392854070296e2c
u1 = 0x2051dc40cefa340a3651d3f10f35455c
u2 = 0x5a8
x0 = 0x76126ce276dc5c53237120d290400a08

ct = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')

from Crypto.Util.number import long_to_bytes
import ast

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
ct_full = bytes.fromhex(data['cipher']['ct'])

# Is it possible that the keystream is NOT x0 || y0 ?
# "Verify trace point T and the recurrence of W_{i+32}= W_i +T in the ciphertext windows."
# What if W_0 = T?
# I already checked that.
