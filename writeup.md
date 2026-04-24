# Android Malware CTF Writeup: "Someone locked my screen but it wasn't me"

## 1. Initial Analysis
The challenge provides an Android package file, `droid.apk`. Based on the description "Someone locked my screen but it wasn't me", the objective is to reverse engineer this ransomware-style application and recover the unlock key/flag.

First, I downloaded and installed `jadx`, an Android decompiler, to extract and decompile the APK's Java source code:

```bash
wget https://github.com/skylot/jadx/releases/download/v1.4.7/jadx-1.4.7.zip
unzip jadx-1.4.7.zip -d jadx_bin
./jadx_bin/bin/jadx -d out droid.apk
```

## 2. Reverse Engineering the Logic
Browsing through the decompiled code in `out/sources/com/example/safedroidlockctf`, I discovered several key components:

### `RecoveryManager.java`
Upon initialization, the app randomly generates a 64-hex-character `deviceIdentifier`.
It then queries a remote C2 server to fetch a session token (`tokenHex`):
```java
String fetchSessionToken = networkClient.fetchSessionToken(str); // str is deviceIdentifier
```
The application derives the main encryption key, `bootEncryptionKey`, by XORing the `deviceIdentifier` and the `tokenHex`:
```java
// Simplified logic of deriveKeyFromHex:
bootEncryptionKey = deviceIdentifier ^ tokenHex
```

### `DemoFileManager.java`
With the `bootEncryptionKey` derived, the application immediately encrypts a local file `personal_secrets.txt` into `personal_secrets.enc` using AES-CBC, and drops a marker file `initialized.marker` to ensure it only runs once.

### `MainActivity.java`
The app displays a lock screen ("SYSTEM LOCKED"). To recover the data, the user must input a hexadecimal recovery key (`obj`).
The app attempts to decrypt the data by deriving a decryption key (`bArr`) and passing it to the AES decryption function:
```java
// Simplified logic:
bArr = obj ^ tokenHex ^ deviceIdentifier
```
Since `bootEncryptionKey = tokenHex ^ deviceIdentifier`, substituting this gives us:
```
bArr = obj ^ bootEncryptionKey
```
For the decryption to successfully restore the file without throwing a padding error, `bArr` MUST exactly equal the original `bootEncryptionKey`.
This mathematical constraint means:
```
obj ^ bootEncryptionKey = bootEncryptionKey
obj = 0
```
This implies the lock screen accepts `0000000000000000000000000000000000000000000000000000000000000000` to decrypt the file. However, this does not yield a flag, as the decrypted file is merely a dummy text file, and `obj` converted to ASCII produces null bytes.

## 3. Network Analysis
I analyzed `NetworkClient.java` to see how the app communicates with the remote server.
The application makes a standard HTTP GET request:
```java
String concat = "http://exp.cybergame.sk:7090/init?h=".concat(str);
```
I wrote a quick Python script to interact with the C2 server and supplied various IDs to observe its behavior:

```python
import urllib.request
import binascii

url = "http://exp.cybergame.sk:7090/init?h=" + ("00" * 32)
req = urllib.request.Request(url)
with urllib.request.urlopen(req) as response:
    res = response.read().decode('utf-8').strip().replace('"', '')
    print(binascii.unhexlify(res))
```
The server returned the hex string corresponding to: `b'You are not a robot :DYou are no'`
Testing with other IDs revealed that the server simply XORs whatever ID it receives with this 32-byte secret string.
Hence, `tokenHex = idHex ^ server_secret`.

## 4. The Breakthrough (User-Agent Spoofing)
Given that the default secret was a playful taunt ("You are not a robot"), I suspected the C2 server was detecting my automated Python script via the default `urllib` User-Agent header.
In malware analysis, it is incredibly common for C2 servers to filter out non-victim traffic.

To mimic the actual Android application, I modified my script to send an Android/Dalvik User-Agent header:

```python
import urllib.request
import binascii

url = "http://exp.cybergame.sk:7090/init?h=" + ("00" * 32)
headers = {"User-Agent": "Dalvik/2.1.0 (Linux; U; Android 14; Pixel 7 Pro Build/UPB5.230623.006)"}
req = urllib.request.Request(url, headers=headers)
with urllib.request.urlopen(req) as response:
    res = response.read().decode('utf-8').strip().replace('"', '')
    print(binascii.unhexlify(res))
```

Executing this payload successfully deceived the C2 server. Instead of the taunt, the server XORed my zeroes with the true ransomware secret, yielding the flag!

### Flag
`SK-CERT{4ndr01d_r4n50mw4r3_w1th_s4f3_ch3ck}`
