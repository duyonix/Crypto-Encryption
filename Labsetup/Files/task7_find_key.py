from Crypto.Cipher import AES
from Crypto.Util.Padding import pad

plain_text = bytearray("This is a top secret.", encoding='utf-8')   #chuyen text thanh day byte
cipher_text = bytearray.fromhex(
    "764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2") # chuyen hex thanh day byte
iv = bytearray.fromhex("aabbccddeeff00998877665544332211")  


with open('./words.txt') as f:
    words = f.read().splitlines()   # doc moi dong trong file words.txt (nhung khong lay dau xuong hang)


def findKey():
    for w in words:
        if len(w) < 16:
            currentKey = w + '#'*(16-len(w))    # them vao cac dau # de du do dai 16
            aes_cbc = AES.new(key=bytearray(
                currentKey, encoding='utf-8'), mode=AES.MODE_CBC, iv=iv)    # cipher
            currentC = aes_cbc.encrypt(pad(plain_text, 16)) # padding len 16 truoc khi encrypt
            if currentC == cipher_text: # ket qua encrypt trung => tim thay key
                print(w)    # xuat ra key va dung chuong trinh
                return


findKey()
