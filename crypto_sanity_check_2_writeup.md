# Crypto Sanity Check 2 Write-up

## Challenge Description
Points: 473

Find the flag for the following string:
`53 53 32 51 48 32 55 51 32 55 52 32 53 49 32 51 48 32 53 54 32 53 51 32 53 54 32 52 56 32 55 52 32 55 51 32 52 101 32 52 56 32 54 98 32 55 97 32 54 51 32 54 97 32 52 101 32 54 98 32 53 56 32 51 50 32 55 56 32 55 48 32 54 49 32 55 97 32 52 101 32 54 54 32 52 101 32 52 55 32 51 53 32 54 54 32 52 100 32 52 55 32 51 53 32 55 48 32 52 100 32 52 55 32 51 53 32 51 57`

## Solution

The provided text appears to be a multi-layered encoding. Let's break it down step-by-step.

### Step 1: Decimal to ASCII
The initial string consists of space-separated numbers in the range 32-101. These are standard decimal ASCII values. By converting these decimal values to their corresponding ASCII characters, we get:
`55 30 73 74 51 30 56 53 56 48 74 73 4e 48 6b 7a 63 6a 4e 6b 58 32 78 70 61 7a 4e 66 4e 47 35 66 4d 47 35 70 4d 47 35 39`

### Step 2: Hex to ASCII
The output from Step 1 is another space-separated string. This time, the values are a mix of numbers and letters, such as `55`, `30`, `73`, `74`, `4e`, etc. These look like hexadecimal values representing ASCII characters. By decoding from hex to ASCII, we get:
`U0stQ0VSVHtsNHkzcjNkX2xpazNfNG5fMG5pMG59`

### Step 3: Base64 Decode
The string `U0stQ0VSVHtsNHkzcjNkX2xpazNfNG5fMG5pMG59` is a classic Base64 encoded string, which we can identify by its alphanumeric characters. By decoding this Base64 string, the final flag is revealed:
`SK-CERT{l4y3r3d_lik3_4n_0ni0n}`

## Flag
**SK-CERT{l4y3r3d_lik3_4n_0ni0n}**
