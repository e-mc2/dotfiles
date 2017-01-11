set nocompatible

syntax on
filetype on
filetype plugin on
filetype indent on

set number
set expandtab
set autoindent
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 softtabstop=2
set laststatus=2 " always show status line
set mouse=a
set clipboard=unnamedplus
set ignorecase incsearch smartcase " set hlsearch

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" lLet Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-commentary'

Plugin 'vim-ruby/vim-ruby'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ervandew/supertab'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'

colorscheme jellybeans 

let mapleader = '<C>'

" NERDtree
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\.swo$']

" air-line
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_map = '<C-p>' 
let g:ctrlp_cmd = 'CtrlP'

" surround
let g:surround_{char2nr('=')} = "<%= \r %>" " yss=
let g:surround_{char2nr('-')} = "<% \r %>"  " yss-

" emmet
let g:user_emmet_leader_key = '<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType erb,html,scss,css EmmetInstall 
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

nnoremap <F5> :NERDTree %<CR>
nnoremap <F3> :Autoformat<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
