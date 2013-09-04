sudo apt-get install git zsh vim xterm awesome awesome-extra &&
here=`pwd`
cd ~
ln -s $here/.zshrc .
ln -s $here/.vimrc .
ln -s $here/.vim .
ln -s $here/.zsh .
ln -s $here/.Xdefaults .
cd -

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
cd -
