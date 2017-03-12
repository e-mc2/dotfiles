set nocompatible

syntax on
filetype on
filetype plugin on
filetype indent on

set number
set expandtab
set autoindent
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2 " always show status line
set mouse=a
set clipboard=unnamedplus
set ignorecase incsearch smartcase " set hlsearch

" show all character
set list
set listchars=tab:→\ ,eol:¬,extends:›,precedes:‹,trail:•,nbsp:␣

set background=dark
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" lLet Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Pretty status line bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-commentary'

Plugin 'vim-ruby/vim-ruby'

"Plugin 'mattn/emmet-vim'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'ervandew/supertab'

" Navigation
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

" Python
Plugin 'davidhalter/jedi-vim'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" Solarized theme settings
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16

" NERDtree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$', '\.swp$', '\.swo$']
" map <Leader>n <plug>NERDTreeTabsToggle<CR>

" jedi-vim settings
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

" air-line
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" surround erb
let g:surround_{char2nr('=')} = "<%= \r %>" " yss=
let g:surround_{char2nr('-')} = "<% \r %>"  " yss-

" emmet
let g:user_emmet_leader_key = '<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType erb,html,scss,css EmmetInstall
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

nnoremap <F5> :NERDTree %<CR>
"nnoremap <F3> :Autoformat<CR>

" insert mode delete line
imap <c-d> <esc>ddi


"" Python
"""""""""""""
imap <c-i> import ipdb; ipdb.set_trace() ############## TRACE ##############


" experiments
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
