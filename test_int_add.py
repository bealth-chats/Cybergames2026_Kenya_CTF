ct = bytes.fromhex('255941a1338e08282443ae04c0a8f8bf0c937d1dc6a60e090b3a0af5ae307e8c3079b4256204874ff23c2a208895b41fe98500898e4b9b22afd8')
w0_x = int.from_bytes(ct[:16], 'big')
w32_x = int.from_bytes(ct[32:48], 'big')

tr_x = 14143528059618230756795996081882139144
p = 240216054091197400064972999812429686881

print('w32_x:', hex(w32_x))
print('w0_x + tr_x mod p:', hex((w0_x + tr_x) % p))
print('w0_x ^ tr_x:', hex(w0_x ^ tr_x))
