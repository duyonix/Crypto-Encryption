#~/bin/bash
set -e
cd ../../../Labsetup/Files

# Encrypt cung 1 file plain text voi cung key va IV
openssl enc -e -aes-128-cbc -in task61_plain.txt -out encrypted_same_iv_1.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111
openssl enc -e -aes-128-cbc -in task61_plain.txt -out encrypted_same_iv_2.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111
echo 'Same IV: '
diff encrypted_same_iv_1.bin encrypted_same_iv_2.bin || :   # || : de bash ignore error code cua diff khi khac nhau

# Encrypt cung 1 file plain text voi cung key, nhung khac IV
openssl enc -e -aes-128-cbc -in task61_plain.txt -out encrypted_diff_iv_1.bin -K 0123456789abcdef0123456789abcdef -iv 11111111111111111111111111111111
openssl enc -e -aes-128-cbc -in task61_plain.txt -out encrypted_diff_iv_2.bin -K 0123456789abcdef0123456789abcdef -iv 22222222222222222222222222222222
echo 'Different IV: '
diff encrypted_diff_iv_1.bin encrypted_diff_iv_2.bin || :   # || : de bash ignore error code cua diff khi khac nhau