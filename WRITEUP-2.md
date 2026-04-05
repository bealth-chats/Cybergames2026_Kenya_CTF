# Tower of Hanoi Revenge - Writeup

## Challenge Overview

The "Tower of Hanoi Revenge" challenge provides a network service and a zip file containing an emulator environment. The goal is to obtain the flag hidden within the system.

- **Points:** 500
- **Service:** `nc exp.cybergame.sk 7011`

## Initial Analysis

The provided zip file contains:
- `markiv_nosocket`: A 64-bit ELF executable (emulator).
- `markivrom.bin`: A 512KB ROM image for the emulator.
- `main.com`: A CP/M executable (the Tower of Hanoi game).
- `Dockerfile` & `docker-compose.yaml`: Infrastructure for the challenge.

The system is a **Mark IV (Z180)** single-board computer running **RomWBW HBIOS v3.5.1** and **CP/M 2.2**.

## Discovery and Attempts

### 1. Automation of the Game
The game `MAIN.COM` is a standard Tower of Hanoi implementation with 5 disks. Solving it requires 31 moves. I wrote a Python script to automate these moves.

**Script Fragment:**
```python
moves = [(1,3), (1,2), (3,2), (1,3), (2,1), (2,3), (1,3), ...]
for src, dst in moves:
    s.sendall(f"{src}\r\n{dst}\r\n")
```

Solving the game resulted in a "Congratulations! You Win!" message but did not yield the flag.

### 2. File System Investigation
Listing the directory (`DIR`) on drive `B:` (the ROM disk) showed two files:
- `FLAG.TXT`
- `MAIN.COM`

However, attempting to read the flag using the standard CP/M `TYPE` command failed:
```
B>TYPE FLAG.TXT
TYPE?
```
The standard CP/M shell seemed restricted or broken, as many built-in commands returned a `?` error.

### 3. Exploring the Boot Loader and Monitor
By sending `<esc>` repeatedly during the boot process, I was able to interrupt the autoboot and enter the **Mark IV Boot Loader**.

The Boot Loader offers several options (`L` command):
- `M`: Monitor
- `C`: CP/M 2.2
- `Z`: Z-System
- `B`: BASIC
- ...

Entering the **Monitor** (`M`) allowed for direct memory manipulation and dumping (`D` command). While I found a fake flag in the local ROM file, scanning the remote memory for the real flag proved time-consuming.

## Final Solution: Z-System

The breakthrough came from booting into **Z-System** (option `Z` in the Boot Loader) instead of the default CP/M. Z-System is an advanced replacement for CP/M that often includes more robust tools and a different command processor.

1.  Connect to the server.
2.  Send `<esc>` multiple times to interrupt boot.
3.  Send `Z` to boot into Z-System.
4.  Navigate to drive `B:`.
5.  Execute `TYPE FLAG.TXT`.

In Z-System, the `TYPE` command worked perfectly and revealed the flag.

### Flag
`SK-CERT{0k4y_n0w_f0r_r34l_h0w_0ld_4r3_y0u}`

## Automation Script

```python
import socket
import time

def solve():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('exp.cybergame.sk', 7011))
    s.settimeout(2)

    # 1. Interrupt boot process
    print("[*] Interrupting boot...")
    for _ in range(50):
        s.sendall(b"\x1b")

    time.sleep(2)
    s.recv(16384) # Clear buffer

    # 2. Boot into Z-System
    print("[*] Booting into Z-System...")
    s.sendall(b"Z\r\n")
    time.sleep(10) # Wait for Z-System to initialize
    s.recv(16384)

    # 3. Read the flag
    print("[*] Reading FLAG.TXT...")
    s.sendall(b"TYPE FLAG.TXT\r\n")
    time.sleep(2)

    output = s.recv(16384).decode('ascii', errors='ignore')
    print("\n--- Output ---")
    print(output)
    print("--------------\n")

    s.close()

if __name__ == "__main__":
    solve()
```
