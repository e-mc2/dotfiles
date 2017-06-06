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

set ignorecase incsearch smartcase
set hlsearch

" witout swp, swo .. files
set nobackup

" use system clipboard (mac os)
set clipboard=unnamed

"don't show preview window
set completeopt-=preview

" show all character
set list
set listchars=tab:→\ ,eol:¬,extends:›,precedes:‹,trail:•,nbsp:␣

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" lLet Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors, status line ...
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'taglist.vim'

" Frontend
Plugin 'mattn/emmet-vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'slim-template/vim-slim'
Plugin 'christoomey/vim-rfactory'

" Python
Plugin 'Valloric/YouCompleteMe'
" Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'mitsuhiko/vim-python-combined'
" Plugin 'hynek/vim-python-pep8-indent'

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Setting up filetype for *.slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Onedark colorscheme
let g:onedark_termcolors = 16
let g:onedark_terminal_italics = 0 " TODO: change to 1
colorscheme onedark

" NERDtree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$', '\.swp$', '\.swo$']
" map <Leader>n <plug>NERDTreeTabsToggle<CR>

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

" NERDTree
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" YCM
let g:ycm_python_binary_path = $PYTHON_HOME
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

" Taglist
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" nnoremap <silent> <bs> <C-w><Left>

" Change semicolon to colon
map ; :

" insert mode delete line
imap <c-d> <esc>ddi


nnoremap <silent> <F8> :TlistToggle<CR>


" experiments
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
ab ip import ipdb; ipdb.set_trace()
" nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
