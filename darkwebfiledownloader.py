import os
from termcolor import colored as color

url = []
while True:
        inp = input("url (if complete gaving full url type false) : ")
        if inp.lower() == "false":
                break
        else:
                url.append(inp)

a = 0
for i in url:
        os.system('clear')
        a+=1
        print(color(f'{len(url)-a} FILES LEFT','green'))
        os.system(f'sudo torsocks wget {i}')
