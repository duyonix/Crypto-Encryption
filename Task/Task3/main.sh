#~/bin/bash
set -e
cd ../../Labsetup/Files

file=pic_original.bmp

# encrypt the picture greenland.bmp as

# ECB
openssl enc  -aes-128-ecb  -e -in ${file} -out pic_cipher_ecb.bmp -K 00112233445566778889aabbccddeeff

# Reset the header of the encrypted picture to make it openable by picture viewer
head -c 54 ${file} > header
tail -c +55 pic_cipher_ecb.bmp > body
cat header body > pic_output_ecb.bmp # -> success to have a view picture/
eog -n pic_output_ecb.bmp &

# CBC
openssl enc  -aes-128-cbc  -e -in ${file} -out pic_cipher_cbc.bmp -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# Reset the header of the encrypted picture to make it openable by picture viewer
head -c 54 ${file} > header
tail -c +55 pic_cipher_cbc.bmp > body
cat header body > pic_output_cbc.bmp # -> fail to have a view pictures
eog -n pic_output_cbc.bmp &


