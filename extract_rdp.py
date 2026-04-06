import sys
import struct

def find_rdp_cache(filename):
    with open(filename, 'rb') as f:
        data = f.read()

    # RDP cache signature: 'RDP8bmp'
    sig = b'RDP8bmp'
    idx = 0
    found = 0
    while True:
        idx = data.find(sig, idx)
        if idx == -1:
            break

        # Check if the signature looks valid as a bmc file
        # usually 8 bytes signature RDP8bmp\x00, followed by version, etc.
        if data[idx:idx+8] == b'RDP8bmp\x00':
            print(f"Found RDP cache file starting at {idx}")

            # The file size isn't always easy to determine, but they are typically 10MB or 100MB
            # Let's extract 10MB for each match
            ext_size = 10 * 1024 * 1024
            ext_data = data[idx:idx+ext_size]
            out_name = f"rdp_cache_{found}.bmc"
            with open(out_name, 'wb') as out:
                out.write(ext_data)
            print(f"Saved to {out_name}")
            found += 1

        idx += 1

if __name__ == "__main__":
    find_rdp_cache(sys.argv[1])
