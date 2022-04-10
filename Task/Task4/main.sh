#~/bin/bash
set -e
cd ../../Labsetup/Files

echo -n "hello world" > test.txt
ls -ld test.txt # 11

# ECB
openssl enc  -aes-128-ecb  -e -in test.txt -out ecb_cipher.bin -K 00112233445566778889aabbccddeef
ls -ld ecb_cipher.bin # 16

# CBC
openssl enc  -aes-128-cbc  -e -in test.txt -out cbc_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
ls -ld cbc_cipher.bin # 16

# CFB
openssl enc  -aes-128-cfb  -e -in test.txt -out cfb_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708 
ls -ld cfb_cipher.bin # 11

# OFB
openssl enc  -aes-128-ofb  -e -in test.txt -out ofb_cipher.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
ls -ld ofb_cipher.bin # 11

# create 3 file to test CBC mode padding
echo -n "ABCDE" > f1.txt # 5 byte
echo -n "ABCDEFGHIJ" > f2.txt # 10 byte
echo -n "ABCDEFGHIJKLMNOP" > f3.txt # 16 byte

# f1.txt encrypted with CBC -> p1.bin
openssl enc  -aes-128-cbc  -e -in f1.txt -out p1.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
ls -ld p1.bin # 16

# f2.txt encrypted with CBC -> p2.bin
openssl enc  -aes-128-cbc  -e -in f2.txt -out p2.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
ls -ld p2.bin # 16

# f3.txt encrypted with CBC -> p3.bin
openssl enc  -aes-128-cbc  -e -in f3.txt -out p3.bin -K 00112233445566778889aabbccddeeff -iv 0102030405060708
ls -ld p3.bin # 32


# DECRYPT 3 files with CBC no-pad

# p1.bin decrypt with CBC -> p1_decrypt.txt
openssl enc  -aes-128-cbc  -d -in p1.bin -out p1_decrypt.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad
hexdump -C p1_decrypt.txt   # 00000000: 41 42 43 44 45 0b 0b 0b 0b 0b 0b 0b 0b 0b 0b 0b  ABCDE...........

# p2.bin decrypt with CBC -> p2_decrypt.txt
openssl enc  -aes-128-cbc  -d -in p2.bin -out p2_decrypt.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad
hexdump -C p2_decrypt.txt   # 00000000  41 42 43 44 45 46 47 48  49 4a 06 06 06 06 06 06  |ABCDEFGHIJ......|

# p3.bin decrypt with CBC -> p3_decrypt.txt
openssl enc  -aes-128-cbc  -d -in p3.bin -out p3_decrypt.txt -K 00112233445566778889aabbccddeeff -iv 0102030405060708 -nopad
hexdump -C p3_decrypt.txt   # 00000000  41 42 43 44 45 46 47 48  49 4a 4b 4c 4d 4e 4f 50  |ABCDEFGHIJKLMNOP|
                            # 00000010  10 10 10 10 10 10 10 10  10 10 10 10 10 10 10 10  |................|
