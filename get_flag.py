import re

with open("main.txt", "r") as f:
    lines = f.readlines()

offsets = []
for line in lines:
    m = re.search(r'movzx  eax,BYTE PTR \[rax\+(0x[0-9a-f]+)\]', line)
    if m:
        offsets.append(int(m.group(1), 16))

with open("lorem", "rb") as f:
    f.seek(0x2000) # .rodata starts here, let's just read a chunk
    rodata = f.read(0x1000)

# The base address used for rax is `_IO_stdin_used+0x8`
# Let's check readelf or objdump for `_IO_stdin_used`.
# Actually from objdump:
# 1184:	48 8d 05 7d 0e 00 00 	lea    rax,[rip+0xe7d]        # 2008 <_IO_stdin_used+0x8>
# So the base address `rax` points to 0x2008 in the file (assuming file offset == vaddr here, typical for non-pie or small pie but let's just use rodata + 8).
# _IO_stdin_used starts at 0x2000. So `_IO_stdin_used+0x8` is 0x2008.
# Wait, let's verify file offset vs vaddr. Readelf says .rodata is at address 0x2000, offset 0x2000. So they are the same!

flag = ""
for off in offsets:
    flag += chr(rodata[0x8 + off])

print("Extracted flag:", flag)
