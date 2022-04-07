#~/bin/bash
set -e
cd ../../LabSetup/Files

# encrypt the picture pic_original.bmp as

# ECB
openssl enc  -aes-128-ecb  -e -in pic_original.bmp -out pic_cipher_ecb.bmp -K 00112233445566778889aabbccddeeff

# Reset the header of the encrypted picture to make it openable by picture viewer
head -c 54 pic_original.bmp > header
tail -c +55 pic_cipher_ecb.bmp > body
cat header body > pic_output_ecb.bmp # -> success to have a view picture

# CBC
openssl enc  -aes-128-cbc  -e -in pic_original.bmp -out pic_cipher_cbc.bmp -K 00112233445566778889aabbccddeeff -iv 0102030405060708

# Reset the header of the encrypted picture to make it openable by picture viewer
head -c 54 pic_original.bmp > header
tail -c +55 pic_cipher_cbc.bmp > body
cat header body > pic_output_cbc.bmp # -> fail to have a view picture