from sys import argv

def xor(first, second):
   return bytearray(x^y for x,y in zip(first, second))

_, first, second, third = argv
p1 = bytearray(first, encoding='utf-8')
padding = 16 - len(p1) % 16
p1.extend([padding]*padding)    #PKCS5

iv1 = bytearray.fromhex(second)
iv2 = bytearray.fromhex(third)

p2 = xor(xor(p1, iv1), iv2)
print("".join("{:02x}".format(x) for x in p2))