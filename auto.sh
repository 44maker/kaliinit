#!/bin/bash
set +e

# Graphical interface
echo -e "\n44maker's Kali Setup Script\n"

# Start SSH
systemctl start ssh
update-rc.d ssh enable
echo -e "\nSSH is running\n"
sleep 3

# APT source
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cat > /etc/apt/sources.list << EOF
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
EOF

# APT update and upgrade
sudo apt-get update -y && sudo apt-get upgrade -y
clear
echo -e "\nAPT update and upgrade is done\n"
sleep 3

# Tools
sudo apt install git libssl-dev libffi-dev build-essential libkrb5-dev systemd-timesyncd -y
clear
echo -e "\ngit libssl-dev libffi-dev build-essential is installed\n"
sleep 3


# Feroxbuster & SecLists
sudo apt install feroxbuster -y

# Rockyou
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

# Zsteg
gem install zsteg

# Steghide
sudo apt-get install steghide -y

# binwalk
sudo apt install binwalk

# chisel
sudo apt-get install chisel -y

# Gmpy2
pip3 install gmpy2

# Dirsearch
sudo apt install dirsearch -y

# Stegseek
wget https://github.com/RickdeJager/stegseek/releases/download/v0.6/stegseek_0.6-1.deb && dpkg -i stegseek_0.6-1.deb && rm stegseek_0.6-1.deb

# Outguess
sudo apt install outguess -y

# Gobuster
sudo apt install gobuster -y

# Git-dumper
pip3 install git-dumper

# Tmux
sudo apt install tmux -y

# Rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
chmod +x rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
sleep 2
rm -rf rustscan_2.0.1_amd64.deb
clear

#ad
sudo apt install neo4j bloodhound.py bloudhound -y

clear
