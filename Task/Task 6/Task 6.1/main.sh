openssl enc -e -aes-128-cbc -in plain.txt -out encrypted_same_iv_1.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111
openssl enc -e -aes-128-cbc -in plain.txt -out encrypted_same_iv_2.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111

openssl enc -e -aes-128-cbc -in plain.txt -out encrypted_diff_iv_1.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111
openssl enc -e -aes-128-cbc -in plain.txt -out encrypted_diff_iv_2.bin -K 0123456789abcdef0123456789abcdef -iv 22222222222222222222222222222222
