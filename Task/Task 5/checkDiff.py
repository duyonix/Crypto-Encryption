encryption_mode = ['ecb', 'cbc', 'cfb', 'ofb']

with open('plain.txt', 'rb') as f:
    plain = f.read()

for mode in encryption_mode:
    with open('plain_' + mode + '_decrypted.txt', 'rb') as f:
        decrypted = f.read()
        
    count = 0
    for i in range(min(len(plain), len(decrypted))):
        if plain[i] != decrypted[i]:
            count += 1
    print(mode + ' ' +str(count+abs(len(plain)-len(decrypted))))