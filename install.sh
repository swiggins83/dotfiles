echo "Installing the goodness..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y \
  zsh awesome awesome-extra vim vim-gtk nodejs npm atom chromium-browser haskell-platform \
  alsa-utils emacs xterm
sudo apt autoremove
npm install -g yarn
npm install -g gulp
cabal install cabal cabal-install

echo "Changing shells..."
chsh -s /bin/zsh

echo "Linking files..."
dotfiles=$(pwd)
cd ~
ln -s $dotfiles/.zshrc .
ln -s $dotfiles/.vimrc .
ln -s $dotfiles/.spacemacs .
ln -s $dotfiles/.vim .
ln -s $dotfiles/.zsh .
ln -s $dotfiles/.Xresources .

mkdir .vimundo
mkdir .config/awesome
cd .config/awesome
ln -s $dotfiles/rc.lua .

cd $dotfiles/..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search

vim
cd ~/.vim/bundle
git clone https://github.com/bronson/vim-trailing-whitespace
git clone https://github.com/kien/rainbow_parentheses.vim
git clone git://github.com/mkitt/tabline.vim.git
git clone https://github.com/Valloric/MatchTagAlways
git clone https://github.com/gorodinskiy/vim-coloresque
git clone https://github.com/fatih/vim-go
git clone https://github.com/terryma/vim-expand-region

cd $dotfiles

cp herald.vim ~/.vim/colors/
