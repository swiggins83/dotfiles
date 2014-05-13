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
set undodir=/home/steven/.vimundo/

" colors
set t_Co=256
colorscheme herald

" mappings
nnoremap ; :
nnoremap : ;
inoremap jj <ESC><Right>
inoremap kk <ESC><Right>
inoremap {{ {<CR>}<ESC>O
inoremap >> ><ESC><<
nnoremap zz :call Foldy()<CR>

" for the yankings and the pastings
nnoremap y "+yy y
nnoremap yj "+2yy

" leader mappings
let mapleader=","
let g:EasyMotion_leader_key = '<Leader>'
nmap <leader>p ;set paste!<CR>
nmap <silent> <leader>l ;NERDTreeToggle<CR>
autocmd vimenter * wincmd l

" custom commands
command Exec execute "!./% %"
map <F5> ;w <ESC>;Exec<CR>

" return you to last place in file
au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" file specifics
autocmd FileType java noremap <buffer> <F9> "zyiw:exe "tabedit ".@z.".java"<CR>
au BufNewFile,BufRead *.py2 set filetype=python
au BufNewFile,BufRead *.jsp set filetype=html

" javas
inoremap sout System.out.println(
" javascripts
inoremap clog console.log(

fu! Foldy()
    let w:should_fold = exists('w:should_fold') ? !w:should_fold : 1

    if w:should_fold
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

" jsLintHint
" :args src/js/src/**/*.js | argdo execute "normal gg=G" | update
autocmd FileType javascript noremap <buffer> <F12> :call JsBeautify()<cr> :%s/function(/function (<cr> :%s/    /\t/g<cr>
