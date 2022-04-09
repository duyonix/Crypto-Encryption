#~/bin/bash
set -e
cd ../../Labsetup/Files

# from File folder in LabSetup
python3 freq.py # to see frequency of words

# from that, try bruteforce each letter to find out the real character
tr 'abcdefghijklmnopqrstuvwxyz' 'cfmypvbrljxwiejdsgkhnawotu' <ciphertext.txt> output.txt

# plaintext after decrypt in Labsetup/Files/output.txt:
cat output.txt 