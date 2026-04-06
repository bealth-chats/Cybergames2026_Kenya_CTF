import sys
import struct
import zlib
import subprocess
import time
import os

URL = "https://files.cybergame.sk/diskbasics-67a70aaf-e773-42f6-9769-c343b5f2db33/vm.zip"

def fetch_range_curl(start, end, retries=5):
    cmd = ["curl", "-s", "-r", f"{start}-{end}", URL]
    for attempt in range(retries):
        result = subprocess.run(cmd, capture_output=True)
        if result.returncode == 0 and len(result.stdout) > 0:
            return result.stdout
        time.sleep(1)
    raise Exception("curl failed after retries")

def read_deflated_stream(offset, comp_size, chunk_size=8*1024*1024):
    decompressor = zlib.decompressobj(-15)
    bytes_read = 0

    while bytes_read < comp_size:
        fetch_len = min(chunk_size, comp_size - bytes_read)
        data = fetch_range_curl(offset + bytes_read, offset + bytes_read + fetch_len - 1)
        if not data:
            break

        decompressed = decompressor.decompress(data)
        if decompressed:
            yield decompressed

        bytes_read += len(data)

    decompressed = decompressor.flush()
    if decompressed:
        yield decompressed

def extract_strings(offset, comp_size):
    print(f"Scanning for strings from offset {offset}")
    buffer = b''

    # We only care about SK-CERT or SK-CERT{flag4_...
    # We can also search for bcache to find paths, or anything else

    target = b'SK-CERT'

    for chunk in read_deflated_stream(offset, comp_size):
        buffer += chunk

        while len(buffer) >= len(target):
            idx = buffer.find(target)
            if idx != -1:
                print(f"Found flag string: {buffer[max(0, idx-50):min(len(buffer), idx+100)]}")
                buffer = buffer[idx+len(target):]
            else:
                buffer = buffer[-len(target):]
                break

if __name__ == "__main__":
    # Small snapshot: Snapshots/{bd0666ae-55de-481d-b64d-25069bcc6e1b}.vdi
    lh_offset = 19626523093
    lh_data = fetch_range_curl(lh_offset, lh_offset + 30 - 1)
    sig, ver, flag, method, mod_time, mod_date, crc32, c_size, u_size, fname_len, extra_len = struct.unpack("<4sHHHHHIIIHH", lh_data[:30])
    data_offset = lh_offset + 30 + fname_len + extra_len

    extract_strings(data_offset, c_size)
