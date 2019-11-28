call plug#begin('~/.vim/plugged')
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git' " :NERDTree
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/w0rp/ale.git' " :AleFix
Plug 'https://github.com/kien/ctrlp.vim.git' " ctrl p <file_to_search>
Plug 'https://github.com/junegunn/goyo.vim.git' " :Goyo
Plug 'https://github.com/tomtom/tcomment_vim.git' " :gcc
Plug 'https://github.com/ycm-core/YouCompleteMe.git' " Then ./install.py
call plug#end()

" ###################
" Syntax
" ###################

syntax on
syntax enable

au BufRead,BufNewFile *.rq set filetype=sparql " Put sparql.vim in ~/.vim/syntax/
au BufRead,BufNewFile *.cypher set filetype=cypher " Put sparql.vim in ~/.vim/syntax/

" ###################
" Colors
" ###################

colorscheme gruvbox
augroup vimrc
   autocmd!
   autocmd ColorScheme * highlight Normal ctermbg=NONE guifg=white guibg=black | highlight MatchParen cterm=bold ctermfg=red ctermbg=NONE gui=bold guifg=red guibg=NONE
augroup END
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set t_Co=256
endif

set encoding=utf8

" ###################
" ALE
" ###################

let g:ale_completion_enabled=1
let g:ale_lint_on_save=0
let g:ale_fix_on_save=0

" pip3 install autopep8, pylint, black
let g:ale_fixers={'python':['autopep8', 'isort', 'black', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers={'cpp':['clang-format', 'clangtidy', 'uncrustify', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'python': ['pylint']}

" ###################
" identLine
" ###################

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ###################
" Turn persistent undo on means that you can undo even when you close a buffer/VIM
" ###################

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" ###################
" Rainbow
" ###################

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" ###################
" Others
" ###################

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set hlsearch " Highlight search terms
set incsearch " Show search matches as you type

" For regular expressions turn magic on
set magic

set expandtab " use spaces instead of tabs

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai " Auto indent
set si " Smart indent
set autoindent " always set autoindenting on
set shiftwidth=4 " number of spaces to use for autoindenting

" Always show the status line
set laststatus=2

set relativenumber
set number " always show line numbers

set showmatch " set show matching parenthesis

set undolevels=1000 " use many muchos levels of undo

set mouse=a

silent !stty -ixon " Allow us to use Ctrl-s and Ctrl-q as keybinds
autocmd VimLeave * silent !stty ixon " Restore default behaviour when leaving Vim

set nocompatible
set display+=lastline
set linebreak
set clipboard=unnamed

" See invisible characters but not spaces
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
