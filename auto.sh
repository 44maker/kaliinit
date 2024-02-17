#!/bin/bash
set +e
clear
# Graphical interface
echo -e "\n44maker's Kali Setup Script\n"

sleep 1
rm -rf Documents Music Pictures Public Templates Videos
sleep 1
clear

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
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt dist-upgrade -y
clear
echo -e "\nAPT update and upgrade is done\n"
sleep 3

# Tools
sudo apt install git libssl-dev libffi-dev build-essential libkrb5-dev systemd-timesyncd ntpdate gcc libmnl-dev libnftnl-dev -y
sudo apt install rlwrap code-oss -y
echo -e "\ngit libssl-dev libffi-dev build-essential is installed\n"
sleep 3

# rtl8812au
sudo apt install realtek-rtl88xxau-dkms -y
sudo apt install dkms -y
git clone https://github.com/aircrack-ng/rtl8812au
cd rtl8812au/
make
sudo make install
cd ../
rm -rf rtl8812au

sleep 2

# Feroxbuster & SecLists
sudo apt install feroxbuster -y

# Rockyou
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

# Zsteg
gem install zsteg
# cmseek
sudo apt install cmseek -y
# Steghide
sudo apt-get install steghide -y

# binwalk
sudo apt install binwalk -y

# chisel
sudo apt-get install chisel -y

# Gmpy2
pip3 install gmpy2

# Dirsearch
sudo apt install dirsearch -y
# fcrackzip
sudo apt install fcrackzip
# Stegseek
wget https://github.com/RickdeJager/stegseek/releases/download/v0.6/stegseek_0.6-1.deb && dpkg -i stegseek_0.6-1.deb && rm stegseek_0.6-1.deb

# Outguess
sudo apt install outguess -y

# Gobuster
sudo apt install gobuster -y

# Tmux
sudo apt install tmux -y
# go
sudo apt-get install -y golang
clear
sleep 2

# Rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
chmod +x rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
sleep 2
rm -rf rustscan_2.0.1_amd64.deb
clear

sleep 2
#ad
sudo apt install neo4j bloodhound.py bloodhound -y

clear
