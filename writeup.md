# CTF Challenge Write-up: 5x5 Grid Challenge

## Challenge Overview
The challenge involves solving a 5x5 grid (sudoku-like matrix) to generate a valid encryption key. The key is then used to decrypt the hidden flag using AES in CBC mode.

The challenge script `get_flag.py` provided these constraints for a 5x5 grid of integers ranging from 1 to 25:
1. Row 0 sums to 15: `([(0,0), (0,1), (0,2), (0,3), (0,4)], 15)`
2. Row 1 sums to 40: `([(1,0), (1,1), (1,2), (1,3), (1,4)], 40)`
3. Row 2 sums to 65: `([(2,0), (2,1), (2,2), (2,3), (2,4)], 65)`
4. Row 3 sums to 90: `([(3,0), (3,1), (3,2), (3,3), (3,4)], 90)`
5. Row 4 sums to 115: `([(4,0), (4,1), (4,2), (4,3), (4,4)], 115)`
6. Main diagonal sums to 65: `([(0,0), (1,1), (2,2), (3,3), (4,4)], 65)`
7. Specific cells sum to 22: `([(0,0), (4,0)], 22)`

## Solution Steps

### 1. Analyzing the Grid Constraints
The constraints provided correspond exactly to a standard layout of integers 1-25 arranged sequentially in a 5x5 grid.

Let's test the sequential arrangement:
```python
grid = [
    [1, 2, 3, 4, 5],       # Sum: 15
    [6, 7, 8, 9, 10],      # Sum: 40
    [11, 12, 13, 14, 15],  # Sum: 65
    [16, 17, 18, 19, 20],  # Sum: 90
    [21, 22, 23, 24, 25]   # Sum: 115
]
```

Checking additional constraints:
- Main diagonal: `1 + 7 + 13 + 19 + 25 = 65` (Matches)
- Specific cells (0,0) and (4,0): `1 + 21 = 22` (Matches)

This basic grid perfectly satisfies all the necessary constraints.

### 2. Generating the Key
The Python script takes the grid, converts its string representation to bytes, and calculates the SHA-256 hash.

```python
import hashlib

def gen_key(matrix):
    matrix_str = str(matrix).encode('utf-8')
    return hashlib.sha256(matrix_str).hexdigest()

key = gen_key(grid)
```

### 3. Decrypting the Flag
The script includes an AES decryption function:
```python
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
```

Passing the derived key to this `get_flag()` function successfully decrypts the ciphertext.

### The Flag
```
SK-CERT{simpl3_m47rix_sud0ku}
```
