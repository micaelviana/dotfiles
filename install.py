import os

print("=========INSTALLERS=========")
print("1 - Manjaro Packages")
print("2 - AUR Packages (do not run in Root mode)")
print("3 - Ubuntu Packages")
print("4 - WSL Packages")

op = int(input("Input your option: "))

if(op ==  1):
    print( "Selected Option: Manjaro")
    os.system('python packages/manjaro.py')
elif(op ==  2): 
    print( "Selected Option: AUR")
    os.system('python packages/aur.py')
elif(op ==  3):
    print( "Selected Option: Ubuntu")
    # pwsh packages/ubuntu.ps1
elif(op ==  4): 
    print( "Selected Option: WSL-Ubuntu")
    os.system('python packages/wsl-ubuntu.py')
else:
    print( "Exit")