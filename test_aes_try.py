import ast
import hashlib
from Crypto.Cipher import AES
from Crypto.Util.number import long_to_bytes

with open('enc.enc') as f:
  data = ast.literal_eval(f.read())
nonce = bytes.fromhex(data['cipher']['nonce'])
ct_full = bytes.fromhex(data['cipher']['ct'])
ct = ct_full[:-16]
tag = ct_full[-16:]

def test_key(key):
    if len(key) not in [16, 24, 32]:
        key = key[:32].ljust(32, b'\0')
    try:
        cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
        pt = cipher.decrypt_and_verify(ct, tag)
        if b'SK' in pt: print("Found! PT:", pt)
        return True
    except:
        return False

tr_x = 14143528059618230756795996081882139144
tr_y = 30966807611185687890035126080071309054

for val in [tr_x, tr_y]:
    b = long_to_bytes(val, 16)
    test_key(b)
    test_key(hashlib.sha256(b).digest())
    test_key(hashlib.md5(b).digest())
