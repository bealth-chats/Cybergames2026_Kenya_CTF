import hashlib
import binascii
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

def get_flag(key_hex):
    ciphertext_hex = "7b324bfbfe9cf9ccdce792276ae92032e9acb2b3342be9e954eb6b8f37d0babf9ea0dfd6c7462b2f3bfd591654940309"
    key = binascii.unhexlify(key_hex)
    raw_data = binascii.unhexlify(ciphertext_hex)
    iv = raw_data[:16]
    encrypted_payload = raw_data[16:]
    cipher = AES.new(key, AES.MODE_CBC, iv)
    decrypted = unpad(cipher.decrypt(encrypted_payload), AES.block_size)
    return decrypted.decode('utf-8')

def gen_key(matrix):
    matrix_str = str(matrix).encode('utf-8')
    return hashlib.sha256(matrix_str).hexdigest()

grid = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20],
    [21, 22, 23, 24, 25]
]

key = gen_key(grid)
try:
    print(get_flag(key))
except Exception as e:
    print(e)
