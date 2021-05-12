set nocompatible
filetype off

" Fuzzy Find
set rtp+=~/.vim/bundle/fzf
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
call vundle#end()
" Status bar
let g:lightline = {'colorscheme': 'powerlineish', 'component_function': {'filename': 'LightlineFilename'}}
" Small function to show the file relative path
" In hindsight I should have just use vim's own status bar
function LightlineFilename()
  return expand('%')
endfunction


" Genuinely dont remember
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion= 1
" No more autocomplete highlighting
let g:ycm_show_diagnostics_ui = 0

" Syntax highlighting
syntax on
color peachpuff
" For solarize to pick up green color
hi Comment ctermfg=64 cterm=bold
" Better highlight word color
hi Search ctermfg=Black
hi Visual ctermfg=Black
" Set vim clipboard to use system clipboard
set clipboard=unnamedplus
" Tab is now space, length 2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Line numbers
set number
set autoindent
set laststatus=2
" Save space for status bar, delete if no status bar install
set noshowmode
" Instant esc
set ttimeout
set ttimeoutlen=0
set timeoutlen=0
" Yea might bite myself in the ass with this one
set noswapfile
" Better search highlight
set incsearch
set hlsearch
" Show normal mode command
set showcmd
" Split side
set splitbelow
set splitright
" Mouse to scroll
" Change the number for different scroll speed
set mouse=a
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>
" Some keybindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Better indenting while in visual and normal mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Work around for <C-i> since alacritty saw it as <tab>
nnoremap <C-n>i <C-i>
