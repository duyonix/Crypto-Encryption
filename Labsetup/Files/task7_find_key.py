from Crypto.Cipher import AES
from Crypto.Util.Padding import pad

plain_text = bytearray("This is a top secret.", encoding='utf-8')
cipher_text = bytearray.fromhex(
    "764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2")
iv = bytearray.fromhex("aabbccddeeff00998877665544332211")


with open('./words.txt') as f:
    words = f.read().splitlines()


def findKey():
    for w in words:
        if len(w) < 16:
            currentKey = w + '#'*(16-len(w))
            aes_cbc = AES.new(key=bytearray(
                currentKey, encoding='utf-8'), mode=AES.MODE_CBC, iv=iv)
            currentC = aes_cbc.encrypt(pad(plain_text, 16))
            if currentC == cipher_text:
                print(w)
                return


findKey()
