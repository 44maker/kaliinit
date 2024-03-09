# kaliinit
two command setup your kali
```bash
sudo passwd root
```
```bash
wget https://raw.githubusercontent.com/44maker/kaliinit/main/kalisetup.sh && chmod +x kalisetup.sh && bash kalisetup.sh
```
# Basic 
1. Delete unnecessary folders
2. Change software source
3. Install base package.
4. Disable lock screen.

# Tools
1. kerbrute
2. bloodyAD
3. pip2&pip3
4. linpeas
5. winpeas
6. pspy64
7. impacket
8. nc64.exe
9. ...
# Manual installation
## Sublime
```bash
wget https://download.sublimetext.com/sublime-text_build-3211_amd64.deb
sudo dpkg -i sublime-text_build-3211_amd64.deb
rm sublime-text_build-3211_amd64.deb
```
## Starship
```bash
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
mkdir -p ~/.config
cd ~/.config
wget https://raw.githubusercontent.com/44maker/kaliinit/main/starship.toml
cd ~
source .zshrc
```
