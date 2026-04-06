import socket
import time

s = socket.socket()
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("0.0.0.0", 7060))
s.listen(1)
conn, addr = s.accept()
conn.sendall(b"\x1b\x00\x00\x00http://212.227.246.142:7050")
time.sleep(2)
conn.close()
