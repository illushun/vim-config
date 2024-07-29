set number
syntax enable

set laststatus=2
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent

set clipboard=unnamed
set backspace=2

let g:rainbow_active=1

call plug#begin('~/vimfiles/plugged')

Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'

Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}

call plug#end()

autocmd vimenter * NERDTree

function Maximize()
    winpos 0 0
    set lines=78
    set columns=237
endfunction

autocmd GUIEnter * call Maximize()
