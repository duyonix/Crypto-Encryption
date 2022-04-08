from sys import argv

# ham trong task 6.2
def xor(first, second):
   return bytearray(x^y for x,y in zip(first, second))

_, first, second, third = argv   # lay tham so tu terminal
p1 = bytearray(first, encoding='utf-8')   #chuyen text thanh day byte
padding = 16 - len(p1) % 16
p1.extend([padding]*padding)    #PKCS5

# chuyen hex thanh day byte
iv1 = bytearray.fromhex(second)
iv2 = bytearray.fromhex(third)

# xor theo cong thuc xay dung p2 (chosen plaintext)
p2 = xor(xor(p1, iv1), iv2)
print("".join("{:02x}".format(x) for x in p2))  # xuat ra theo kieu hex vi encryption oracle chi nhan plaintext la hex
