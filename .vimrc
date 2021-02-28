set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

let g:lightline = {'colorscheme': 'jellybeans', }
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion= 1
syntax on
color peachpuff

" for solarize to pick up green color
hi Comment ctermfg=64

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
set showcmd
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
