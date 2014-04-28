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
nnoremap asd :wq<CR>
nnoremap ` @
inoremap jj <ESC><Right>
inoremap kk <ESC><Right>
inoremap {{ {<CR>}<ESC>O
inoremap >> ><ESC><<

" for the yankings
nnoremap yj Vj :call GetVisual()<CR>
nnoremap yk Vk :call GetVisual()<CR>
fu! GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction

" leader mappings
let mapleader=","
let g:EasyMotion_leader_key = '<Leader>'
nmap <leader>p ;set paste!<CR>
nmap <silent> <leader>l ;NERDTreeToggle<CR>
autocmd vimenter * wincmd l

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

" rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif
