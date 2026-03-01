# CTF Forensics Challenge Writeup

## Description
> This time, I tried to hide the flag much better. You should try to check the content of the image.

The flag format is `SK-CERT{...}`.

## Step-by-Step Solution

1. **Initial Inspection**: We are given a PNG image named `elephant.png`. The description hints at checking the content of the image.

2. **File Identification**: First, let's verify the file type.
   ```bash
   $ file elephant.png
   elephant.png: PNG image data, 1050 x 700, 8-bit colormap, non-interlaced
   ```
   It's a valid PNG image.

3. **Analyzing Metadata**: The hint "check the content" often suggests looking into the file's metadata or hidden data chunks. A great tool for extracting metadata from images is `exiftool`.

   ```bash
   $ exiftool elephant.png
   ```

   The output of this command reveals various details about the image:
   ```
   ...
   Color Type                      : Palette
   Compression                     : Deflate/Inflate
   ...
   User Comment                    : Flag=U0stQ0VSVHtqdXM3X3BuZ191czNyX2MwbW0zbjd9
   ...
   ```

4. **Decoding the Payload**: The `User Comment` field contains the string `Flag=U0stQ0VSVHtqdXM3X3BuZ191czNyX2MwbW0zbjd9`. The value `U0stQ0VSVHtqdXM3X3BuZ191czNyX2MwbW0zbjd9` looks like Base64 encoding.

   We can decode this Base64 string to see the actual content:
   ```bash
   $ echo 'U0stQ0VSVHtqdXM3X3BuZ191czNyX2MwbW0zbjd9' | base64 -d
   SK-CERT{jus7_png_us3r_c0mm3n7}
   ```

5. **Flag**: The decoded string matches the expected flag format `SK-CERT{...}`.

## Final Flag
`SK-CERT{jus7_png_us3r_c0mm3n7}`