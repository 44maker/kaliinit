#!/bin/bash
set +e
# set never lock screen
xfconf-query -c xfce4-session -p /general/LockCommand -s "xflock4 --no-lockscreen"

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
# pyenv
curl https://pyenv.run | bash

sleep 4

cat >> ~/.zshrc <<-'EOF'
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
EOF
sleep 2

#go
echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc
echo 'export PATH=$PATH:$GOROOT/bin/:$GOPATH/bin' >> ~/.zshrc
source ~/.zshrc
clear

#tmux
sleep 2
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
set -g mouse on
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
sleep 2

clear

# githacker
python3 -m pip install -i https://pypi.org/simple/ GitHacker

#ad
go install github.com/ropnop/kerbrute@latest

#binary
mkdir -p Tools/linux && cd Tools/linux
sleep 3
wget https://github.com/opsec-infosec/nmap-static-binaries/releases/download/v2/nmap-x64.tar.gz
sleep 2
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64
wget https://github.com/shadow1ng/fscan/releases/latest/download/fscan
mkdir exploit && cd exploit
curl -fsSL https://raw.githubusercontent.com/ly4k/PwnKit/main/PwnKit -o PwnKit
wget https://raw.githubusercontent.com/Liuk3r/CVE-2023-32233/main/exploit.c && mv exploit.c CVE-2023-32233.c
wget https://raw.githubusercontent.com/Arinerron/CVE-2022-0847-DirtyPipe-Exploit/main/exploit.c && mv exploit.c dirtypipe.c
cd ~
mkdir -p Tools/ad && cd Tools/ad
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
# impacket
pyenv install 3.8.18
sleep 2
pyenv virtualenv 3.8.18 impacket
sleep 2
pyenv activate impacket
sleep 2
git clone https://github.com/ThePorgs/impacket/ 
cd impacket
pip3 install -r requirements.txt 
python3 setup.py install
clear
sleep 2
cat >> ~/.zshrc <<-'EOF'
export PATH="$PATH:$HOME/.pyenv/versions/impacket/bin"
EOF
cd ~

mkdir -p Tools/windows && cd Tools/windows
wget https://raw.githubusercontent.com/samratashok/nishang/master/Shells/Invoke-PowerShellTcp.ps1
wget https://github.com/itm4n/FullPowers/releases/download/v0.1/FullPowers.exe
wget https://raw.githubusercontent.com/int0x33/nc.exe/master/nc64.exe
wget https://github.com/shadow1ng/fscan/releases/latest/download/fscan.exe
wget https://github.com/tylerdotrar/SigmaPotato/releases/latest/download/SigmaPotato.exe
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winpeas.bat
wget https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1
cd ~
mkdir -p Tools/web && cd Tools/web
wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php
sleep 1
wget https://raw.githubusercontent.com/synacktiv/php_filter_chain_generator/main/php_filter_chain_generator.py

clear
cd ~
mkdir -p Tools/ctf && cd Tools/ctf
git clone https://github.com/urbanadventurer/username-anarchy.git
wget https://raw.githubusercontent.com/ius/rsatool/master/rsatool.py
git clone https://github.com/Heisenberk/rsa-ctf-tool.git

sleep 2
clear
cd ~
sleep 1

echo "alias cl='clear' " >> .zshrc
echo "alias impacket='pyenv activate impacket' " >> .zshrc
echo "alias deactivate='source deactivate' " >> .zshrc
echo "alias cme='crackmapexec' " >> .zshrc
echo "export PATH="$PATH:$HOME/.local/bin"" >> ~/.zshrc
clear
sleep 1
source ~/.zshrc

clear
