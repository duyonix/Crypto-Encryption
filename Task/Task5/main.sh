#~/bin/bash
set -e

openssl enc -e -aes-128-ecb -in plain.txt -out encrypted_ecb.bin -K 01234567890123456789012345678901
bless encrypted_ecb.bin
# byte thu 55 (offset 0x37) luc dau la 11111100 10110100 00111101 01100100
# thuc hien or voi 00000000000000000000000000000001 (Tools -> Bitwise Operations)
# ra 11111100 10110100 00111101 01100101 (da bi corrupted)
openssl enc -d -aes-128-ecb -in encrypted_ecb.bin -out plain_ecb_decrypted.txt -K 01234567890123456789012345678901

openssl enc -e -aes-128-cbc -in plain.txt -out encrypted_cbc.bin -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab
bless encrypted_cbc.bin
openssl enc -d -aes-128-cbc -in encrypted_cbc.bin -out plain_cbc_decrypted.txt -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab

openssl enc -e -aes-128-cfb -in plain.txt -out encrypted_cfb.bin -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab
bless encrypted_cfb.bin
openssl enc -d -aes-128-cfb -in encrypted_cfb.bin -out plain_cfb_decrypted.txt -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab

openssl enc -e -aes-128-ofb -in plain.txt -out encrypted_ofb.bin -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab
bless encrypted_ofb.bin
openssl enc -d -aes-128-ofb -in encrypted_ofb.bin -out plain_ofb_decrypted.txt -K 01234567890123456789012345678901 -iv abcdeabcdeabcdeabcdeabcdeabcdeab

python checkDiff.py