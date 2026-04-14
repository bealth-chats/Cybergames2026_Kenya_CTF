import ast
import hashlib
from Crypto.Cipher import AES

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
        print("Found with raw bytes! PT:", pt)
        return True
    except:
        return False

pt1 = bytes.fromhex('07328ed650e8f2b76304b49805df866ac31cf56836e92e8b0cb22dc6a60a5c783935e482eef137378b34c96033ca87be2cedfe84')
pt2 = bytes.fromhex('07328ed650e8f2b749b359458a4c52b7dfa66ef43fbb26d695936db96e7b0ede4a3e9322be6b947574724d655df20743a866')

for p in [pt1, pt2]:
    test_key(p[:16])
    test_key(p[:32])
    test_key(p[-16:])
    test_key(p[-32:])
    test_key(hashlib.sha256(p).digest())
