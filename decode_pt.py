pt1 = b'\x072\x8e\xd6P\xe8\xf2\xb7c\x04\xb4\x98\x05\xdf\x86j\xc3\x1c\xf5h6\xe9.\x8b\x0c\xb2-\xc6\xa6\n\\\x95\xe4\x82\xee\xf177\x8b4\xc9`3\xca\x87\xbe,\xed\xfe\x84'
pt2 = b'\x072\x8e\xd6P\xe8\xf2\xb7I\xb3YE\x8aLR\xb7\xdf\xa6n\xf4?\xbb&\xd6\x95\x93m\xb9n{\x0e\xdeJ>\x93"\xbek\x94utrMe]\xf2\x07C\xa8f'

keys = [b"Jacob", b"cool", b"truth", b"Jacobian", b"twist"]

def xor(data, key):
    return bytes([data[i] ^ key[i % len(key)] for i in range(len(data))])

for k in keys:
    res1 = xor(pt1, k)
    if all(32 <= b <= 126 for b in res1):
        print(f"Key {k} -> PT1: {res1}")
    res2 = xor(pt2, k)
    if all(32 <= b <= 126 for b in res2):
        print(f"Key {k} -> PT2: {res2}")
