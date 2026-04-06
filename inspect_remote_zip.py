import requests
import zipfile
import io
import binascii

class HttpFile(io.RawIOBase):
    def __init__(self, url):
        self.url = url
        self.session = requests.Session()

        # Get content-length using a HEAD request
        response = self.session.head(url)
        self.length = int(response.headers['content-length'])
        self.position = 0

    def read(self, size=-1):
        if size == -1:
            size = self.length - self.position
        if size == 0:
            return b""

        end = self.position + size - 1
        headers = {'Range': f'bytes={self.position}-{end}'}

        # Keep retrying in case of connection issues
        while True:
            try:
                response = self.session.get(self.url, headers=headers)
                if response.status_code in (200, 206):
                    self.position += len(response.content)
                    return response.content
                else:
                    print(f"Failed to fetch data, status: {response.status_code}")
                    return b""
            except Exception as e:
                print(f"Error fetching data: {e}")
                # Retry

    def seek(self, offset, whence=io.SEEK_SET):
        if whence == io.SEEK_SET:
            self.position = offset
        elif whence == io.SEEK_CUR:
            self.position += offset
        elif whence == io.SEEK_END:
            self.position = self.length + offset
        return self.position

    def tell(self):
        return self.position

    def readable(self):
        return True

    def seekable(self):
        return True

def search_for_files():
    url = "https://files.cybergame.sk/diskbasics-67a70aaf-e773-42f6-9769-c343b5f2db33/vm.zip"
    print(f"Opening remote zip at {url}")
    f = HttpFile(url)

    print(f"File size: {f.length}")

    print("Opening ZipFile...")
    z = zipfile.ZipFile(f)
    print("Files in zip:")

    for info in z.infolist():
        print(f"Found: {info.filename} ({info.file_size} bytes)")
        if 'vmdk' in info.filename.lower() or 'vdi' in info.filename.lower() or 'qcow2' in info.filename.lower() or 'vhdx' in info.filename.lower() or 'raw' in info.filename.lower() or 'img' in info.filename.lower():
            print(f"Opening disk image {info.filename} ... this might not work if it's too big or complex, but let's try reading the first few MBs.")

            with z.open(info.filename) as disk_file:
                # Read the first 10MB of the disk to look for signatures or bootloaders, etc.
                # Just a test to see if we can read inside the zip
                head = disk_file.read(1024 * 1024 * 10)
                print(f"Read 10MB from {info.filename}. Signature: {binascii.hexlify(head[:16])}")

if __name__ == "__main__":
    search_for_files()
