set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
call vundle#end()

let g:lightline = {'colorscheme': 'jellybeans', }
syntax on
color peachpuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set autoindent
set smartindent
set laststatus=2
set noshowmode
set ttimeout
set ttimeoutlen=0
set timeoutlen=0
set noswapfile
set incsearch
set hlsearch
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
