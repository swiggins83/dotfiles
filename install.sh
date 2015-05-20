dotfiles=$(pwd)
cd ~
ln -s $dotfiles/.zshrc .
ln -s $dotfiles/.vimrc .
ln -s $dotfiles/.vim .
ln -s $dotfiles/.zsh .
ln -s $dotfiles/.Xresources .
cd -

cd ..
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/olivierverdier/zsh-git-prompt
git clone https://github.com/zsh-users/zsh-history-substring-search
cd -

vim
cd ~/.vim/bundle
git clone https://github.com/bronson/vim-trailing-whitespace
git clone https://github.com/akhaku/vim-java-unused-imports
git clone https://github.com/kien/rainbow_parentheses.vim
git clone git://github.com/mkitt/tabline.vim.git
git clone https://github.com/Valloric/MatchTagAlways
git clone https://github.com/gorodinskiy/vim-coloresque
git clone https://github.com/fatih/vim-go
cd -

cp herald.vim ~/.vim/colors/

cd
mkdir .vimundo
cd -
