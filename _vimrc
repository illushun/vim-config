call plug#begin('~/vimfiles/plugged')

Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'NLKNguyen/papercolor-theme'

Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
Plug 'jwalton512/vim-blade'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentline'

Plug 'stanangeloff/php.vim'
Plug 'phpactor/phpactor'

call plug#end()

colorscheme PaperColor

set number
syntax enable

set laststatus=2
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set autochdir

let &guifont="JetBrains_Mono:h14:b:cANSI:qDRAFT"

set clipboard=unnamed
set backspace=2
set omnifunc=ale#completion#OmniFunc

inoremap <S-Tab> <C-d>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t> :$tab split<CR>
nnoremap <C-q> :tabclose<CR>

let g:rainbow_active=1
let g:ackprg = 'ag --vimgrep'
let g:deoplete#enable_at_startup=1
let g:ale_fix_on_save=1
let g:ale_virtualtext_cursor='current'
let g:indentLine_color_gui='#A4E57E'
let g:indentLine_char='| '

autocmd vimenter * NERDTree
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"

function Maximize()
    winpos 0 0
    set lines=78
    set columns=237
endfunction

autocmd GUIEnter * call Maximize()

function s:zt() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! ZT call s:zt()
nnoremap <silent> <C-A> :zt<CR>
