import ast
from Crypto.Util.number import long_to_bytes

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
ct_full = bytes.fromhex(data['cipher']['ct'])

p = 240216054091197400064972999812429686881
a = 202528927977825293762893890130927217592

for i in range(len(ct_full) - 31):
    window = ct_full[i:i+32]
    w_x = int.from_bytes(window[:16], 'big')
    w_y = int.from_bytes(window[16:32], 'big')
    y2 = (pow(w_x, 3, p) + a * w_x) % p
    if pow(w_y, 2, p) == y2:
        print(f"Window at {i} is a valid point!")
