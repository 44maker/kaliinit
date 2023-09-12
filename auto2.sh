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
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
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
sleep 2
pip install bloodyAD


# impacket
pyenv install 3.8.18
sleep 2
pyenv virtualenv 3.8.18 impack
sleep 2
pyenv activate impack
sleep 2
git clone https://github.com/ThePorgs/impacket/ 
cd impacket
pip3 install -r requirements.txt 
python3 setup.py install

clear
sleep 2
cat >> ~/.zshrc <<-'EOF'
export PATH="$PATH:/home/kali/.pyenv/versions/impack/bin"
EOF

clear
cd ~
sleep 3
init 6
