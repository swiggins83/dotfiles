#!/bin/bash
if [ "$1" -eq "-f" ]; then
	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install git \
	zsh \
	vim \
	xterm \
	awesome \
	awesome-extra \
	acpi
fi

dotfiles=`pwd`

cd ~
ln -s $dotfiles/.zshrc .
ln -s $dotfiles/.vimrc .
ln -s $dotfiles/.vim .
ln -s $dotfiles/.zsh .
ln -s $dotfiles/.Xdefaults .
cd -

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
cd -

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/maksimr/vim-jsbeautify.git
git clone https://github.com/vim-scripts/closetag.vim
cd -
