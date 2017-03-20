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
set nobackup " witout swp, swo .. files

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

" Frontend
Plugin 'mattn/emmet-vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" Python
Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'mitsuhiko/vim-python-combined'
" Plugin 'hynek/vim-python-pep8-indent'

" Onedark colorscheme
let g:onedark_termcolors = 16
let g:onedark_terminal_italics = 0 " TODO: change to 1
colorscheme onedark

" NERDtree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$', '\.swp$', '\.swo$']
" map <Leader>n <plug>NERDTreeTabsToggle<CR>

" jedi-vim settings
" let g:jedi#popup_on_dot = 0
" let g:jedi#use_tabs_not_buffers = 0

" air-line
let g:airline_powerline_fonts = 1
" let g:airline_theme='onedark'
" let g:lightline = {
"   \ 'colorscheme': 'onedark',
"   \ }

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

" python
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1

let g:pymode_options = 1
let g:pymode_options_max_line_length = 110
let g:pymode_options_colorcolumn = 1

let g:pymode_folding = 0
let g:pymode_indent = 1

let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'

let g:pymode_motion = 1

let g:pymode_virtualenv = 0
" let g:pymode_virtualenv_path = $WORKON_HOME

let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 1

let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

let g:pymode_rope_goto_definition_bind = '<leader>d'




" insert mode delete line
imap <c-d> <esc>ddi


" experiments
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
