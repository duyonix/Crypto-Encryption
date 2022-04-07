from Crypto.Cipher import AES
from Crypto.Util.Padding import pad

plain_text = bytearray("This is a top secret.", encoding='utf-8')
cipher_text = bytearray.fromhex("764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2")
iv = bytearray.fromhex("aabbccddeeff00998877665544332211")


with open('./words.txt') as f:
    keys = f.readlines()

def findKey():
    for k in keys:
        k = k.rstrip('\n')
        if len(k) < 16:
            currentKey = k + '#'*(16-len(k))
            aes_cbc = AES.new(key=bytearray(currentKey,encoding='utf-8'), mode=AES.MODE_CBC, iv=iv)
            currentC = aes_cbc.encrypt(pad(plain_text, 16))
            if currentC == cipher_text:
                print(currentKey)
                return

findKey()