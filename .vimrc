set nocompatible

syntax on
filetype on
filetype plugin on
filetype indent on

set number relativenumber
set expandtab
set autoindent

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2 " always show status line
set mouse=a
set colorcolumn=110

set ignorecase incsearch smartcase
set hlsearch

" witout swp, swo .. files
set nobackup

" use system clipboard (mac os)
set clipboard=unnamed

" don't show preview window
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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmux-plugins/vim-tmux'

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
Plugin 'matze/vim-move'
Plugin 'romgrk/winteract.vim'

Plugin 'tpope/vim-dispatch'
Plugin 'reinh/vim-makegreen'
Plugin '5long/pytest-vim-compiler'

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
Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'mitsuhiko/vim-python-combined'
" Plugin 'hynek/vim-python-pep8-indent'

" Run tests
Plugin 'janko-m/vim-test'

" Fuzzy search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Linters
Plugin 'scrooloose/syntastic'
" Plugin 'w0rp/ale'
" Plugin 'nvie/vim-flake8'

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Setting up filetype for *.slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Onedark colorscheme
let g:onedark_termcolors = 16
let g:onedark_terminal_italics = 0 " TODO: change to 1
colorscheme onedark

" Leader mapping
let mapleader = "\<Space>"

" NERDtree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$', '\.swp$', '\.swo$']
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeFind<CR>
" map <Leader>n <plug>NERDTreeTabsToggle<CR>

" vim-move
let g:move_key_modifier = 'A'
map ∆ <A-j>
map ˚ <A-k>

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

" virtualenv
let g:virtualenv_directory = $WORKON_HOME
let g:virtualenv_stl_format = '[%n]'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225 --max-line-length=120'


" test.vim
" function MakeGreenStrategy(cmd) abort
"     execute '!' .a:cmd
"     call MakeGreen()
" endfunction

" let g:test#custom_strategies = {'makegreen': function('MakeGreenStrategy')}
let g:test#strategy = 'makegreen'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -p no:cacheprovider'

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" autocmd FileType python compiler pytest


" Taglist
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

" YCM
let g:ycm_python_binary_path = $PYTHON_HOME
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

" Fzf
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading
  \       --fixed-strings --ignore-case --hidden
  \       --follow --glob "!.git/*" --color "always" '
  \   .shellescape(
  \     <q-args>), 1,
  \     <bang>0 ? fzf#vim#with_preview('up:60%')
  \             : fzf#vim#with_preview('right:50%:hidden', '?'),
  \     <bang>0)
nmap <C-f> :Find<CR>

" winteract.vim
nmap <leader>w :InteractiveWindow<CR>

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
nnoremap <silent> <F2> :VirtualEnvActivate <tab>

" experiments
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>f :Find <C-r><C-w><CR>
ab ip import ipdb; ipdb.set_trace()
