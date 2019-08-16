execute pathogen#infect()

set autoindent
set cursorline
set number
set hlsearch
set si
set laststatus=2
set shiftwidth=4
set tabstop=4
set expandtab
set undofile
set undodir=/Users/stevenwiggins/.vimundo
set mouse=a
set clipboard=unnamedplus

" colors
set t_Co=256
colorscheme herald


" mappings
let mapleader=","
nnoremap ; :
nnoremap : ;
nnoremap zz :call Foldy()<CR>
nnoremap <leader>; A;<ESC>
nnoremap q<Tab> :q<CR>
nnoremap QQ :qall<CR>
inoremap jj <ESC><Right>
inoremap kk <ESC><Right>
inoremap {{ {<CR>}<ESC>O
inoremap >> ><ESC><<
inoremap sout System.out.println();<ESC>hha
inoremap clog console.log();<ESC>hha
noremap <leader>n ;set nu!<CR>
noremap <leader>p ;set paste! <CR> ;set nu! <CR> ;IndentLinesToggle <CR>
nnoremap <leader>s :/\(<<<<\\|====\\|>>>>\)<CR>
nnoremap <Space><Space> <ESC>
noremap <S-H> ^
noremap <S-L> $

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:ctrlp_cmd='CtrlP .'

" return you to last place in file
au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" file specifics
au BufNewFile,BufRead *.py2 set filetype=python
au BufNewFile,BufRead *.jsp set filetype=html
au BufNewFile,BufRead *.less set filetype=css

" for matchtag
let g:mta_filetype = {
    \ 'html': 1,
    \ 'xhtml': 1,
    \ 'xml': 1,
    \ 'jsp': 1,
    \ 'js': 1,
\}

fu! Foldy()
    if foldclosed('.') == '-1'
        normal! zfat
    else
        normal! za
    endif
endfunction

" rainbows!
syntax on
filetype on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
