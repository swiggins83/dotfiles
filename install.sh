sudo apt-get install git zsh vim xterm awesome awesome-extra &&
cp .zshrc ~
cp .vimrc ~
cp -r .vim ~
cp -r .zsh ~
cp .Xdefaults ~
#sudo cp rc.lua /etc/xdg/awesome/

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
cd -
