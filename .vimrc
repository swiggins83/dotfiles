set autoindent
set cursorline
set number
set hlsearch
set si
set laststatus=2
set shiftwidth=4
set tabstop=4

set undofile
set undodir=/home/uportal/.vimundo/

inoremap jj <ESC>
inoremap {{ {<CR>}<ESC>O

colorscheme adrian_modified

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
