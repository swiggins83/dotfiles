sudo apt-get install git zsh vim xterm awesome awesome-extra &&
cd ~
ln -s .zshrc .
ln -s .vimrc .
ln -s .vim .
ln -s .zsh .
ln -s .Xdefaults .
cd -

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
cd -
