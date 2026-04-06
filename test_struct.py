import struct
import zlib

def test():
    fmt = "<4sHHHHHIIIHHHHHII"
    print(struct.calcsize(fmt))

test()