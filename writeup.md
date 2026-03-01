# CTF Challenge Write-up: `lorem`

## Objective
The goal of this challenge was to find a hidden flag within the provided `lorem` binary file. The expected format of the flag is `SK-CERT{...}`.

## Analysis Steps

### 1. Initial Exploration
The first step in analyzing any unknown file is to determine its type. Running the `file` command revealed that `lorem` is an ELF 64-bit executable for Linux:

```bash
$ file lorem
lorem: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked...
```

To see if the flag was stored in plain text, I extracted the readable strings using the `strings` command:

```bash
$ strings lorem > strings.txt
```

Scanning through the strings revealed standard libc imports, some lorem ipsum text, but no obvious flag in the `SK-CERT{...}` format. Running the binary directly (`./lorem`) didn't print the flag either.

### 2. Disassembly and Reverse Engineering
Since the flag wasn't available in plain text, the next step was to analyze the binary's code. I used `objdump` to disassemble the `lorem` executable:

```bash
$ objdump -M intel -d lorem > objdump.txt
```

I focused on the `main` function to understand the program's logic. By extracting the assembly instructions for `main`:

```bash
$ objdump -M intel -d lorem | grep -A 200 "<main>:" > main.txt
```

Looking at the disassembly of `main`, I observed a repetitive pattern of instructions:

```assembly
    ...
    1184:	48 8d 05 7d 0e 00 00 	lea    rax,[rip+0xe7d]        # 2008 <_IO_stdin_used+0x8>
    118b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    118f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1193:	0f b6 80 5f 01 00 00 	movzx  eax,BYTE PTR [rax+0x15f]
    119a:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    ...
```

These instructions load a base address (`_IO_stdin_used+0x8`) into `rax`. This address points to the start of the `.rodata` section (which contains read-only data like strings). Then, the program repeatedly reads single bytes from this base address at specific offsets using `movzx eax,BYTE PTR [rax+<offset>]`. Finally, it constructs a string by storing these bytes into adjacent local stack variables (`rbp-0x40`, `rbp-0x3f`, etc.).

### 3. Extracting the Flag Data
The `.rodata` section contains the actual characters. To extract the flag, we need to read the bytes at the specific offsets found in the disassembly from the `.rodata` section.

I used `readelf` to locate the `.rodata` section:

```bash
$ readelf -S lorem
```

This confirmed that the `.rodata` section starts at file offset `0x2000`. The base address loaded into `rax` corresponds to `0x2008` in the file.

### 4. Automating Flag Extraction
To avoid manually looking up each character, I wrote a Python script to automate the process. The script does two things:
1. Parses the disassembly output (`main.txt`) to extract the list of offsets used in the `movzx` instructions.
2. Reads the `lorem` binary file, accesses the bytes at those specific offsets relative to the base address (`0x2008`), and concatenates them to form the flag.

```python
import re

# Read the disassembly of the main function
with open("main.txt", "r") as f:
    lines = f.readlines()

offsets = []
# Extract the offsets from the movzx instructions
for line in lines:
    m = re.search(r'movzx  eax,BYTE PTR \[rax\+(0x[0-9a-f]+)\]', line)
    if m:
        offsets.append(int(m.group(1), 16))

# Read the binary file
with open("lorem", "rb") as f:
    f.seek(0x2000) # Jump to the .rodata section
    rodata = f.read(0x1000)

flag = ""
# Reconstruct the flag using the offsets
for off in offsets:
    # 0x8 is added because the base address is _IO_stdin_used+0x8 (which is at offset 0x2008)
    flag += chr(rodata[0x8 + off])

print("Extracted flag:", flag)
```

### 5. The Solution
Running the Python script successfully reconstructed the hidden string, revealing the flag!

```
Extracted flag: SK-CERT{34sy_70_d3bug_wh3n_y0u_h4v3_wh0l3_c0d3}
```
