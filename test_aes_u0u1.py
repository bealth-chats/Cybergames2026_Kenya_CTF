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
        return False
    try:
        cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
        pt = cipher.decrypt_and_verify(ct, tag)
        print("Found with GCM! PT:", pt)
        return True
    except:
        return False

u0 = 0x4ea54f94fa1c2723c392854070296e2c
u1 = 0x2051dc40cefa340a3651d3f10f35455c

key = long_to_bytes(u0, 16) + long_to_bytes(u1, 16)
test_key(key)
key = long_to_bytes(u1, 16) + long_to_bytes(u0, 16)
test_key(key)
