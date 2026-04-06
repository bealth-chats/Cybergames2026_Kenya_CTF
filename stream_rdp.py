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
        print(f"curl failed, retrying {attempt+1}/{retries}")
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
        sys.stdout.write(f"\rRead {bytes_read/(1024*1024):.2f}MB / {comp_size/(1024*1024):.2f}MB")
        sys.stdout.flush()

    decompressed = decompressor.flush()
    if decompressed:
        yield decompressed
    print()

def scan_for_rdp(offset, comp_size):
    print(f"Scanning for RDP signatures from offset {offset}")
    sig = b'RDP8bmp\x00'
    buffer = b''
    found = 0
    in_file = False
    file_data = bytearray()

    for chunk in read_deflated_stream(offset, comp_size):
        buffer += chunk

        while len(buffer) >= 8:
            if not in_file:
                idx = buffer.find(sig)
                if idx != -1:
                    print(f"\nFound signature at offset...")
                    in_file = True
                    file_data = bytearray()
                    buffer = buffer[idx:]
                else:
                    buffer = buffer[-7:]
                    break

            if in_file:
                file_data.extend(buffer)
                buffer = b''

                # Check for end of file or if it's reached 10MB
                if len(file_data) > 10 * 1024 * 1024:
                    with open(f"rdp_cache_{found}.bmc", 'wb') as f:
                        f.write(file_data[:10*1024*1024])
                    print(f"Saved rdp_cache_{found}.bmc")
                    found += 1
                    in_file = False
                    buffer = file_data[10*1024*1024:]
                break

    if in_file and len(file_data) > 1024:
        with open(f"rdp_cache_{found}.bmc", 'wb') as f:
            f.write(file_data)
        print(f"Saved rdp_cache_{found}.bmc")

if __name__ == "__main__":
    lh_offset = 68
    lh_data = fetch_range_curl(lh_offset, lh_offset + 30 - 1)
    sig, ver, flag, method, mod_time, mod_date, crc32, c_size, u_size, fname_len, extra_len = struct.unpack("<4sHHHHHIIIHH", lh_data[:30])
    data_offset = lh_offset + 30 + fname_len + extra_len

    scan_for_rdp(data_offset, c_size)
