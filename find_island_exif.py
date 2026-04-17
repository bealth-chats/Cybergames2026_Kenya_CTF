import subprocess
try:
    output = subprocess.check_output(['exiftool', 'travellers_part1.webp'])
    print(output.decode('utf-8'))
except FileNotFoundError:
    print("exiftool not installed")
