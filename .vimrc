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

let mapleader=","
" easy motion
let g:EasyMotion_leader_key = '<Leader>'

" mappings
inoremap jj <ESC>
inoremap kk <ESC>
inoremap {{ {<CR>}<ESC>O
nmap <silent> <leader>l :NERDTreeToggle<CR>

" custom commands
command AndroidBuild execute "!ant clean debug uninstall install %"
map <F1> :w <ESC>:AndroidBuild<CR><Space>

" colors
set t_Co=256
colorscheme monokai

" return you to last place in file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" for nerdtree
" autocmd vimenter * NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1

autocmd vimenter * wincmd l 

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
" not for nerd tree

execute pathogen#infect()
