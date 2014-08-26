#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh vim-gnome xterm git awesome awesome-extra

dotfiles=$(pwd)
cd ~
ln -s $dotfiles/.zshrc .
ln -s $dotfiles/.vimrc .
ln -s $dotfiles/.vim .
ln -s $dotfiles/.zsh .
ln -s $dotfiles/.Xresources .
#rc.lua - mkdir .config/awesome??
cd -

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/funayman/PySpotifyInfo
cd -

vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/vim-scripts/closetag.vim
git clone https://github.com/bronson/vim-trailing-whitespace
git clone https://github.com/akhaku/vim-java-unused-imports
git clone https://github.com/kien/rainbow_parentheses.vim
#git clone https://github.com/vim-scripts/VimClojure
#git clone https://github.com/mattn/emmet-vim.git
git clone git://github.com/mkitt/tabline.vim.git
git clone https://github.com/Valloric/MatchTagAlways
cd -

cp herald.vim ~/.vim/colors/

cd
mkdir .vimundo
cd -
