#!/usr/bin/python3

# XOR two bytearrays, ham co san trong file sample_code.py duoc cho san trong Labsetup.zip
def xor(first, second):
   return bytearray(x^y for x,y in zip(first, second))

# dien cac input cua de bai
MSG   = "This is a known message!"
HEX_1 = "a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159"
HEX_2 = "bf73bcd3509299d566c35b5d450337e1bb175f903fafc159"

# Convert ascii string to bytearray
p1 = bytes(MSG, 'utf-8')

# Convert hex string to bytearray
c1 = bytearray.fromhex(HEX_1)
c2 = bytearray.fromhex(HEX_2)

# phep tinh p2 = p1 xor c1 xor c2
print(xor(xor(p1,c1), c2))
