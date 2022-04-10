#~/bin/bash
set -e
cd ../../Labsetup/Files

file=greenland.bmp
eog -n ${file} &

# encrypt the picture greenland.bmp as

# ECB
openssl enc  -aes-128-ecb  -e -in ${file} -out pic_cipher_ecb.bmp -K 00112233445566778889aabbccddeeff

# encrypt to get a viewable picture
head -c 54 ${file} > header
tail -c +55 pic_cipher_ecb.bmp > body
cat header body > pic_output_ecb.bmp # -> success to have a viewable picture
eog -n pic_output_ecb.bmp &

# CBC
openssl enc  -aes-128-cbc  -e -in ${file} -out pic_cipher_cbc.bmp -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# encrypt to get a viewable picture
head -c 54 ${file} > header
tail -c +55 pic_cipher_cbc.bmp > body
cat header body > pic_output_cbc.bmp # -> fail to have a viewable picture
eog -n pic_output_cbc.bmp &


