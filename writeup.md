# Crypto CTF Challenge Write-up

## Challenge Description
Find the flag for the following string: `FX-PREG{flzz37evp_e0747v0a}`.
The flag format is `SK-CERT{}` unless stated otherwise.

## Solution
Looking at the provided string `FX-PREG{...}` and comparing it to the standard flag format `SK-CERT{...}`, we can analyze the transformation applied to the prefix:
- `F` shifted by 13 is `S`
- `X` shifted by 13 is `K`
- `P` shifted by 13 is `C`
- `R` shifted by 13 is `E`
- `E` shifted by 13 is `R`
- `G` shifted by 13 is `T`

This confirms that the text has been encrypted using **ROT13**, a simple substitution cipher that replaces a letter with the 13th letter after it in the alphabet.

To find the flag, we just need to apply ROT13 to the inner string `flzz37evp_e0747v0a`, keeping numbers and special characters like `_` unmodified.

- `f` -> `s`
- `l` -> `y`
- `z` -> `m`
- `z` -> `m`
- `3` -> `3`
- `7` -> `7`
- `e` -> `r`
- `v` -> `i`
- `p` -> `c`
- `_` -> `_`
- `e` -> `r`
- `0` -> `0`
- `7` -> `7`
- `4` -> `4`
- `7` -> `7`
- `v` -> `i`
- `0` -> `0`
- `a` -> `n`

Combining these translated characters, we get `symm37ric_r0747i0n`.

## Flag
**SK-CERT{symm37ric_r0747i0n}**
