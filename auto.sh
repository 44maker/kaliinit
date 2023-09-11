#!/bin/bash
set +e

# Graphical interface
echo -e "\n44maker's Kali Setup Script\n"

# Start SSH
sudo systemctl start ssh
sudo update-rc.d ssh enable
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

# Python2 pip
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
clear
sleep 3

# Pip2 and pip3
pip3 install --upgrade setuptools && python3 -m pip install --upgrade pip && pip2 install --upgrade setuptools && python2 -m pip install --upgrade pip
clear
echo -e "\nPip2 and pip3 are upgraded\n"
sleep 3

sleep 2
#go
sudo apt-get install -y golang
echo 'export GOPATH=/root/go-workspace' >> ~/.zshrc
echo 'export GOROOT=/usr/local/go' >> ~/.zshrc
echo 'export PATH=$PATH:$GOROOT/bin/:$GOPATH/bin' >> ~/.zshrc
source ~/.zshrc


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
sleep 3
cat > ~/.tmux.conf <<-'EOF'
#tmux attach 如果无分离终端则新建
new-session
# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind ' " '
unbind %
bind -r k select-pane -U # 绑定k为↑
bind -r j select-pane -D # 绑定j为↓
bind -r h select-pane -L # 绑定h为←
bind -r l select-pane -R # 绑定l为→
# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf; display-message "Config reloaded.."
bind V source-file ~/.tmux/layout1         #ctrl b + shift v => change
EOF

mkdir ~/.tmux
sleep 1
cat > ~/.tmux/layout1 <<-'EOF'
selectp -t 0 # select the first (0) pane
splitw -v -p 50 # split it into two halves
selectp -t 1 # select the new, second (1) pane
splitw -h -p 50 # split it into two halves
selectp -t 0 # go back to the first pane
EOF

# Rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
chmod +x rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
sleep 2
rm -rf rustscan_2.0.1_amd64.deb
clear
#binary
mkdir -p tools/binary&&cd tools/binary
sleep 3
wget https://github.com/opsec-infosec/nmap-static-binaries/releases/download/v2/nmap-x64.tar.gz
sleep 2
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
cd ../
mkdir ad&&cd ad
git clone https://github.com/urbanadventurer/username-anarchy.git
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git


clear
#ad
sudo apt install neo4j bloodhound.py bloudhound -y
go install github.com/ropnop/kerbrute@latest

git clone https://github.com/ThePorgs/impacket/ 
pip3 install -r requirements.txt 
python3 setup.py install
pip install bloodyAD

clear


# Verify installation
tools=("nmap" "chisel" "kerbrute" "impacket" "bloodhound.py" "neo4j" "bloodhound" "feroxbuster" "steghide" "zsteg" "binwalk" "gobuster" "outguess" "tmux" "rustscan" "stegseek" "dirsearch" "git-dumper" "gmpy2" "pipenv")
success=1
for tool in "${tools[@]}"
do
    if [ -x "$(command -v $tool)" ]; then
        echo "$tool is installed"
    else
        echo "$tool is not installed"
        success=0
    fi
done

if [ $success -eq 1 ]; then
    echo "success"
else
    echo "installation failed"
fi
