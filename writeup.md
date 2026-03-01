# Write-up: XOR Cipher Challenge

## Challenge Description
We are given two files:
- `ciphertext.txt` containing the encrypted flag.
- `encryptor.py` containing the encryption logic used to encrypt the flag.

The goal is to decrypt the ciphertext and retrieve the flag, which is in the format `SK-CERT{...}`.

## Analysis
Let's analyze the files provided.

### `encryptor.py`
```python
def xor_cipher(data, key):
    hex_output = []
    for i in range(len(data)):
        char_xor = ord(data[i]) ^ ord(key[i % len(key)])
        hex_output.append(f"{char_xor:02x}")
    return "".join(hex_output)

HARDCODED_KEY = "cybergame"
plain_flag = "SK-CERT{...}" # empty flag for demonstration

print(xor_cipher(plain_flag, HARDCODED_KEY))
```

From `encryptor.py`, we can observe the following:
1. The encryption used is a simple **XOR cipher**.
2. Each character of the plaintext is XORed with a corresponding character of the key.
3. The key is repeated cyclically if it's shorter than the plaintext (`key[i % len(key)]`).
4. The result of the XOR operation is converted to a two-digit hexadecimal string.
5. The hardcoded key used for encryption is `"cybergame"`.

### `ciphertext.txt`
```
30324f263735351656570a1b3a45573e1f56154a101641381605560d261b5507380959135026550d41380a5e1c1e
```
This file contains the hex-encoded ciphertext.

## Decryption Process
XOR encryption is symmetric, meaning the exact same operation used to encrypt the data can be used to decrypt it, provided we have the key.

Since:
`plaintext ^ key = ciphertext`
Then:
`ciphertext ^ key = plaintext`

### Steps to Decrypt
1. **Decode the Hex String**: First, we need to convert the hex string back into bytes.
2. **Apply XOR**: We iterate through the bytes, XORing each byte with the corresponding character of the key `"cybergame"`.
3. **Convert to Characters**: Convert the resulting XORed values back to ASCII characters to reveal the plaintext.

### Python Decryption Script
We can write a simple Python script to reverse the process:

```python
def xor_decrypt(hex_data, key):
    # Convert hex string to bytes
    data = bytes.fromhex(hex_data)
    output = []

    # Iterate through bytes and XOR with key
    for i in range(len(data)):
        char_xor = data[i] ^ ord(key[i % len(key)])
        output.append(chr(char_xor))

    return "".join(output)

ciphertext = "30324f263735351656570a1b3a45573e1f56154a101641381605560d261b5507380959135026550d41380a5e1c1e"
key = "cybergame"

print(xor_decrypt(ciphertext, key))
```

Running this script outputs the original flag:

`SK-CERT{34sy_70_r3v3rs3_wh3n_y0u_h4v3_7h3_k3y}`

## Flag
**SK-CERT{34sy_70_r3v3rs3_wh3n_y0u_h4v3_7h3_k3y}**
