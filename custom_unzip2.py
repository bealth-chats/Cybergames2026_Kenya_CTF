import subprocess
import struct
import sys
import zlib
import os

URL = "https://files.cybergame.sk/diskbasics-67a70aaf-e773-42f6-9769-c343b5f2db33/vm.zip"
SIZE = 32127327286

def fetch_range_curl(url, start, end):
    print(f"DEBUG: fetching {start}-{end}")
    cmd = ["curl", "-s", "-r", f"{start}-{end}", url]
    result = subprocess.run(cmd, capture_output=True)
    if result.returncode != 0:
        raise Exception(f"curl failed: {result.stderr}")
    return result.stdout

def find_eocd(data):
    signature = b'\x50\x4b\x05\x06'
    idx = data.rfind(signature)
    return idx if idx != -1 else None

def parse_eocd(eocd_data):
    fmt = "<4sHHHHIIH"
    unpacked = struct.unpack(fmt, eocd_data[:22])
    return {
        'total_entries': unpacked[4],
        'cd_size': unpacked[5],
        'cd_offset': unpacked[6]
    }

def main():
    print(f"Total size: {SIZE} bytes", flush=True)

    fetch_size = min(100 * 1024, SIZE)
    start_pos = SIZE - fetch_size

    print(f"Fetching last {fetch_size} bytes using curl...", flush=True)
    tail_data = fetch_range_curl(URL, start_pos, SIZE - 1)

    eocd_idx = find_eocd(tail_data)
    if eocd_idx is None:
        print("Could not find EOCD signature!", flush=True)
        return

    print("Found standard EOCD signature!", flush=True)
    eocd_info = parse_eocd(tail_data[eocd_idx:eocd_idx+22])
    cd_offset = eocd_info['cd_offset']
    cd_size = eocd_info['cd_size']
    total_entries = eocd_info['total_entries']

    if cd_offset == 0xFFFFFFFF or cd_size == 0xFFFFFFFF:
        print("Standard EOCD indicates Zip64. We need to find the Zip64 Locator.", flush=True)
        zip64_loc_sig = b'\x50\x4b\x06\x07'
        z64_idx = tail_data.rfind(zip64_loc_sig)
        if z64_idx != -1:
            loc_fmt = "<4sIQI"
            sig, disk, eocd64_offset, total_disks = struct.unpack(loc_fmt, tail_data[z64_idx:z64_idx+20])
            eocd64_data = fetch_range_curl(URL, eocd64_offset, eocd64_offset + 56 - 1)
            rec_fmt = "<4sQHHIIQQQQ"
            unpacked = struct.unpack(rec_fmt, eocd64_data[:56])
            cd_offset = unpacked[9]
            cd_size = unpacked[8]
            total_entries = unpacked[7]
            print(f"Zip64 CD Offset: {cd_offset}, CD Size: {cd_size}, Total Entries: {total_entries}", flush=True)
        else:
            print("Zip64 locator not found.", flush=True)
            return

    print(f"Fetching Central Directory (size: {cd_size}, offset: {cd_offset}) using curl...", flush=True)
    cd_data = fetch_range_curl(URL, cd_offset, cd_offset + cd_size - 1)

    print("Parsing Central Directory...", flush=True)
    pos = 0
    files = []

    for i in range(total_entries):
        if pos + 46 > len(cd_data):
            break

        sig = cd_data[pos:pos+4]
        if sig != b'\x50\x4b\x01\x02':
            break

        fmt = "<4sHHHHHHIIIHHHHHII"
        unpacked = struct.unpack(fmt, cd_data[pos:pos+46])

        comp_method = unpacked[4]
        comp_size = unpacked[8]
        uncomp_size = unpacked[9]
        fname_len = unpacked[10]
        extra_len = unpacked[11]
        comment_len = unpacked[12]
        local_header_offset = unpacked[16]

        fname = cd_data[pos+46:pos+46+fname_len].decode('utf-8', errors='replace')

        if uncomp_size == 0xFFFFFFFF or comp_size == 0xFFFFFFFF or local_header_offset == 0xFFFFFFFF:
            extra_field = cd_data[pos+46+fname_len:pos+46+fname_len+extra_len]
            epos = 0
            while epos + 4 <= len(extra_field):
                header_id, data_size = struct.unpack("<HH", extra_field[epos:epos+4])
                if header_id == 0x0001:
                    idx = epos + 4
                    if uncomp_size == 0xFFFFFFFF and idx + 8 <= len(extra_field):
                        uncomp_size = struct.unpack("<Q", extra_field[idx:idx+8])[0]
                        idx += 8
                    if comp_size == 0xFFFFFFFF and idx + 8 <= len(extra_field):
                        comp_size = struct.unpack("<Q", extra_field[idx:idx+8])[0]
                        idx += 8
                    if local_header_offset == 0xFFFFFFFF and idx + 8 <= len(extra_field):
                        local_header_offset = struct.unpack("<Q", extra_field[idx:idx+8])[0]
                        idx += 8
                epos += 4 + data_size

        files.append({
            'name': fname,
            'comp_size': comp_size,
            'uncomp_size': uncomp_size,
            'offset': local_header_offset,
            'method': comp_method
        })

        pos += 46 + fname_len + extra_len + comment_len

    for f in files:
        print(f"File: {f['name']} (Size: {f['uncomp_size']}, Offset: {f['offset']})", flush=True)

    targets = ['jano.vbox', 'jano.vbox-prev', 'jano.nvram', 'Snapshots/2026-03-27T08-42-45-992720000Z.nvram', 'Snapshots/2026-03-27T08-49-08-191850000Z.nvram']

    for target_name in targets:
        for f in files:
            if f['name'] == target_name:
                print(f"Extracting {f['name']}...", flush=True)
                lh_offset = f['offset']
                lh_data = fetch_range_curl(URL, lh_offset, lh_offset + 30 - 1)

                sig, ver, flag, method, mod_time, mod_date, crc32, c_size, u_size, fname_len, extra_len = struct.unpack("<4sHHHHHIIIHH", lh_data[:30])

                data_offset = lh_offset + 30 + fname_len + extra_len
                print(f"Data offset for {f['name']} is {data_offset}. Compressed size: {f['comp_size']}", flush=True)

                if f['comp_size'] > 0:
                    file_data = fetch_range_curl(URL, data_offset, data_offset + f['comp_size'] - 1)

                    if f['method'] == 8:
                        uncompressed = zlib.decompress(file_data, -15)
                    elif f['method'] == 0:
                        uncompressed = file_data
                    else:
                        print(f"Unsupported compression method: {f['method']}", flush=True)
                        continue

                    local_name = f['name'].replace('/', '_')
                    with open(local_name, 'wb') as out:
                        out.write(uncompressed)
                    print(f"Saved {f['name']} to {local_name}", flush=True)

if __name__ == "__main__":
    main()