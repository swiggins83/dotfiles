set autoindent
set cursorline
set number
set hlsearch
set si
set laststatus=2
set shiftwidth=4
set tabstop=4

set undofile
set undodir=/home/steven/.vimundo/

inoremap jj <ESC>
inoremap {{ {<CR>}<ESC>O

set t_Co=256

colorscheme monokai

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
