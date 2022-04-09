#~/bin/bash
set -e
cd ../../Labsetup/Files

# ECB
# encrypt
openssl enc  -aes-128-ecb  -e -in ciphertext.txt -out ecb_cipher.bin -K 00112233445566778889aabbccddeef

# decrypt
openssl enc  -aes-128-ecb  -d -in ecb_cipher.bin -out ecb_plain.txt -K 00112233445566778889aabbccddeef

# is equal
diff ecb_plain.txt ciphertext.txt # the same

# CBC
# encrypt
openssl enc  -aes-128-cbc  -e -in ciphertext.txt -out cbc_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# decrypt
openssl enc  -aes-128-cbc  -d -in cbc_cipher.bin -out cbc_plain.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# is equal
diff cbc_plain.txt ciphertext.txt # the same

# CFB
#encrypt
openssl enc  -aes-128-cfb  -e -in ciphertext.txt -out cfb_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708

#decrypt
openssl enc  -aes-128-cfb  -d -in cfb_cipher.bin -out cfb_plain.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# is equal
diff ciphertext.txt cfb_plain.txt # the same

# OFB
#encrypt
openssl enc  -aes-128-ofb  -e -in ciphertext.txt -out ofb_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708

#decrypt
openssl enc  -aes-128-ofb  -d -in ofb_cipher.bin -out ofb_plain.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# is equal
diff ciphertext.txt ofb_plain.txt # the same