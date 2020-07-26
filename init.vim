call plug#begin('~/.config/nvim/plugged/')
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'https://github.com/chrisbra/csv.vim.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/lervag/vimtex.git'
Plug 'https://github.com/w0rp/ale.git'
call plug#end()

" Syntax
" ------------------------------------------

syntax on
syntax enable

au BufRead,BufNewFile *.rq set filetype=sparql
au BufRead,BufNewFile *.cypher set filetype=cypher
au BufRead,BufNewFile *.log set filetype=log

autocmd FileType python set colorcolumn=79

" Buffers
" ------------------------------------------

set hidden
let no_buffers_menu=1

" Next buffer
noremap <C-Tab> :bn<CR>
" Previous buffer
noremap <C-S-Tab> :bp<CR>
" Close buffer
noremap <C-q> :bd<CR>

" Move into the different windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Colors
" ------------------------------------------

colorscheme gruvbox
set background=dark
if g:colors_name == "gruvbox"
    highlight Normal ctermbg=16 guibg=#000000 guifg=#ffffff
endif

hi SpellBad cterm=underline

" Set extra options when running in GUI mode
if has('gui_running')
    set t_Co=256
endif

set encoding=utf8

" identLine
" ------------------------------------------

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ctrlp
" ------------------------------------------

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" LaTeX
" ------------------------------------------

" In tex files, no preview
let g:tex_conceal = ''

" Turn persistent undo on means that you can undo even when you close a buffer/VIM
" ------------------------------------------

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Rainbow
" ------------------------------------------

let g:rainbow_active = 1 " Set to 0 if you want to enable it later via :RainbowToggle

" YCM and UltiSnips
" ------------------------------------------

let g:ycm_autoclose_preview_window_after_completion=1

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Leader
" ------------------------------------------

let mapleader=','

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <leader>t :NERDTree<cr>
let NERDTreeShowHidden=1

" Command to change variable whenever I want
nnoremap <leader>k :let g:ale_fix_on_save=(1 - g:ale_fix_on_save)<cr>

" Change spelllang
set spell
set spelllang=en
nnoremap <leader>sf :set spelllang=fr<cr>
nnoremap <leader>se :set spelllang=en<cr>

" ALE
" ------------------------------------------

let g:ale_linters = {
\    'python': ['bandit', 'pycodestyle', 'pydocstyle', 'flake8'],
\    'markdown': ['proselint'],
\    'text': ['proselint'],
\    'tex': ['lacheck'],
\    'cpp': ['clang'],
\    'bib': ['bibclean'],
\}

let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['isort', 'autopep8'],
\    'markdown': ['prettier'],
\    'tex': ['latexindent'],
\    'cpp': ['uncrustify', 'clang-format'],
\    'bib': ['bibclean'],
\}

let g:ale_lint_on_save=1
let g:ale_lint_on_enter=0
let g:ale_completion_enabled=0
let g:airline#extensions#ale#enabled=1
let g:ale_c_parse_compile_commands=1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_fix_on_save=1

" Others
" ------------------------------------------

" Clipboard
set clipboard=unnamedplus

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

" Highlight search terms
set hlsearch

" Show search matches as you type
set incsearch

" For regular expressions turn magic on
set magic

" Use spaces instead of tabs
set expandtab

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has('gui_macvim')
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

" Auto indent
set ai

" Smart indent
set si

" Always set autoindenting on
set autoindent

" Number of spaces to use for autoindenting
set shiftwidth=4

" Always show the status line
set laststatus=2

set relativenumber

" Always show line numbers
set number

" Set show matching parenthesis
set showmatch

" Use many much levels of undo
set undolevels=1000

set mouse=a

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim
autocmd VimLeave * silent !stty ixon

set nocompatible
set display+=lastline
set linebreak

" See invisible characters but not spaces
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Does not quit visual mode
vmap < <gv
vmap > >gv
