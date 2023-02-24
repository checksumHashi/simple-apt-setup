#!/bin/bash

cat << END
 ________  ___  ___  ________                     
|\   ____\|\  \|\  \|\   __  \                    
\ \  \___|\ \  \\\  \ \  \|\  \                   
 \ \_____  \ \  \\\  \ \   ____\                  
  \|____|\  \ \  \\\  \ \  \___|                  
    ____\_\  \ \_______\ \__\                     
   |\_________\|_______|\|__|                     
   \|_________|                                   
                                                  
                                                  
 ________  ___  _________  ________  ___  ___     
|\   __  \|\  \|\___   ___\\   ____\|\  \|\  \    
\ \  \|\ /\ \  \|___ \  \_\ \  \___|\ \  \\\  \   
 \ \   __  \ \  \   \ \  \ \ \  \    \ \   __  \  
  \ \  \|\  \ \  \   \ \  \ \ \  \____\ \  \ \  \ 
   \ \_______\ \__\   \ \__\ \ \_______\ \__\ \__\\
    \|_______|\|__|    \|__|  \|_______|\|__|\|__|
                                                  

END

RED='\033[1;31m'

sudo apt update -y
sudo apt full-upgrade -y

echo -e "${RED}UPDATED AND UPGRADED"

# C PROGRAMMING

sudo apt install gcc -y
sudo apt install gdb -y

echo -e "${RED}INSTALLED GCC AND GDB"

# PYTHON PROGRAMMING

sudo apt install python3 python3-pip -y

echo -e "${RED}INSTALLED PYTHON3 AND PIP3"

# VSCODE

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

echo -e "${RED}INSTALLED VS CODE"

code --install-extension ms-python.python
code --install-extension formulahendry.code-runner

echo -e "${RED}INSTALLED PYTHON AND CODE RUNNER EXTENSION FOR VS CODE"

# APPS

sudo apt install snap
sudo snap install discord

echo -e "${RED}INSTALLED DISCORD"

# GENERAL USE PROGRAMS

sudo apt install duf htop btop speedtest-cli screenfetch neofetch -y

echo -e "${RED}INSTALLED HTOP, BTOP, SPEEDTEST-CLI, SCREENFETCH, NEOFETCH"

# SETTING UP UPDATE SCRIPT

updscript="sudo apt update\nsudo apt full-upgrade\nsudo snap refresh\nsudo apt auto-remove\nsudo apt clean"
echo -e "$updscript" >> /home/"$USER"/upd.sh
sudo chmod a+x /home/"$USER"/upd.sh

# SETTING UP .BASHRC

stellar="$(cat stellar.dat)"

echo -e "alias upd=\"sudo ./upd.sh\"\ncat << END\n$stellar\nEND" | tee -a /home/"$USER"/.bashrc

echo -e "${RED}BASHRC SETUP COMPLETE"

# FINAL APT CHECK

sudo apt update -y
sudo apt full-upgrade -y

echo -e "${RED}FINAL APT CHECK DONE"

cat << END
 _____ _____ _____ _____ _____ _____ _____ 
|     |  |  |   __|     |  |  |  |  |  _  |
|   --|     |   __|   --|    -|  |  |   __|
|_____|__|__|_____|_____|__|__|_____|__|   

END
duf
neofetch