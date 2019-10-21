call plug#begin('~/.vim/plugged')
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/PProvost/vim-ps1.git'
Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git' " Then ./install.py
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
call plug#end()

set nocompatible

colorscheme gruvbox

augroup vimrc
   autocmd!
   autocmd ColorScheme * highlight Normal ctermbg=NONE guifg=white guibg=black | highlight MatchParen cterm=bold ctermfg=red ctermbg=NONE gui=bold guifg=red guibg=NONE
augroup END

let g:rainbow_active = 1

set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

set relativenumber
set display+=lastline

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set clipboard=unnamed

set linebreak

filetype on
syntax on

set hidden

set encoding=utf-8

set tabstop=4
set backspace=indent,eol,start " allo backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set undolevels=1000      " use many muchos levels of undo
" set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile
set nowb

filetype plugin indent on
" autocmd filetype python set expandtab " to set some file type specific settings

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set mouse=a

set ruler " always show current position
set cmdheight=2 "height of the command bar
set background=dark
set expandtab " use spaces instead of tabs

set pastetoggle=<F2>

" ALE
let g:ale_completion_enabled=1
let g:ale_lint_on_save=1
let g:ale_fix_on_save=0

" pip3 install autopep8, pylint, black
let g:ale_fixers={'python':['autopep8', 'isort', 'black']}
" let b:ale_linters={'python':['pylint']}

let g:ale_fixers={'json':['fixjson', 'prettier', 'jq']}
