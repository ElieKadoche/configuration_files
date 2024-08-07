call plug#begin('~/.config/nvim/plugged/')
Plug 'https://github.com/nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}

" Linux and Darwin only
Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release', 'for': ['tex', 'yaml']}
Plug 'https://github.com/ycm-core/YouCompleteMe.git'

" Android only
" Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}

Plug 'https://github.com/Mofiqul/dracula.nvim.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/camspiers/lens.vim.git'
Plug 'https://github.com/chrisbra/csv.vim.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/lervag/vimtex.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/qpkorr/vim-bufkill.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/w0rp/ale.git'
call plug#end()

" Syntax
" ------------------------------------------

syntax on
syntax enable

au BufRead,BufNewFile *.rq set filetype=sparql
au BufRead,BufNewFile *.cypher set filetype=cypher
au BufRead,BufNewFile *.log set filetype=log

" No comment on next line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

autocmd FileType python set colorcolumn=79

" Colors
" ------------------------------------------

" General parameters
set termguicolors
set background=dark
set encoding=utf8

" Custom colorsheme
colorscheme dracula
highlight Normal ctermbg=none ctermfg=white guibg=none guifg=#ffffff

" Set extra options when running in GUI mode
if has('gui_running')
    set t_Co=256
endif

" ALE
" ------------------------------------------

let g:ale_linters = {
\    'bib': ['bibclean'],
\    'cpp': ['clang'],
\    'python': ['bandit', 'pycodestyle', 'pydocstyle', 'flake8'],
\    'tex': ['lacheck', 'texlab'],
\    'text': ['languagetool'],
\}

" Eventually 'markdown': ['prettier']
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'bib': ['bibclean'],
\    'cpp': ['uncrustify', 'clang-format'],
\    'python': ['isort', 'autopep8'],
\    'tex': ['textlint', 'latexindent'],
\}

" Ignore languagetool
let g:ale_linters_ignore = {
\   'markdown': ['languagetool'],
\}

let g:airline#extensions#ale#enabled=1
let g:ale_c_parse_compile_commands=1
let g:ale_completion_enabled=0
let g:ale_fix_on_save=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1

let g:ale_sign_error='>>'
let g:ale_sign_warning='--'

" Buffers
" ------------------------------------------

set hidden
let no_buffers_menu=1

" Move around split with control + direction
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Automatically resize splits
augroup AutoResizeSplits
  autocmd!
  autocmd BufWinEnter,WinEnter,WinNew,VimResized  * if &filetype !=# 'nerdtree' | set winwidth=87 | endif
  autocmd BufWinEnter,WinEnter,WinNew,VimResized * if &filetype !=# 'nerdtree' | wincmd = | endif
augroup END

" coc.vim
" ------------------------------------------

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
set updatetime=300

" csv.vim
" ------------------------------------------

" Highlight column
let g:csv_highlight_column='y'

" ctrlp
" ------------------------------------------

let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Font
" ------------------------------------------

set guifont=Fira\ Code\ Retina:h10

" indentLine
" ------------------------------------------

let g:indentLine_char_list=['|', '¦', '┆', '┊']

" lightline
" ------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  return expand('%')
endfunction

" LaTeX
" ------------------------------------------

let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'

" Leader
" ------------------------------------------

let mapleader=','

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>t :NERDTree<cr>
let NERDTreeShowHidden=1

" Command to change variable whenever I want
nnoremap <leader>k :let g:ale_fix_on_save=(1 - g:ale_fix_on_save)<cr>

" Change spelllang
set nospell
nnoremap <leader>sn :set nospell<cr>
nnoremap <leader>sf :set spelllang=fr<cr> :set spell<cr>
nnoremap <leader>se :set spelllang=en<cr> :set spell<cr>

" 1 sentence by line
nnoremap <leader>p :s/\. /.\r/g <CR> :noh <CR>

" A silly one that I love: sort selected lines by length
" We use xnoremap because we call this function in visual mode
xnoremap <leader>l :'<,'> ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Move around buffers
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>x :BD<CR>

" lens.vim
" ------------------------------------------

" Disable animations
let g:lens#animate = 0

" NERDTree
" ------------------------------------------

" No statusline
let g:NERDTreeStatusline = '%#NonText#'

" Open NERDTree if vim executed without arguments
autocmd VimEnter * if !argc() | NERDTree | endif

" nvim-treesitter
" ------------------------------------------

" Consistent syntax highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ['foo.bar'] = 'Identifier',
    },
  },
}
EOF

" Incremental selection based on the named nodes from the grammar
lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
}
EOF

" Tree-sitter based indentation
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

" Tree-sitter based folding
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Rainbow
" ------------------------------------------

let g:rainbow_active=1 " Set to 0 if you want to enable it later via :RainbowToggle

" Undo
" ------------------------------------------

" Turn persistent undo on means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" vim-snippets
" ------------------------------------------

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'custom_snippets']

" YCM and UltiSnips
" ------------------------------------------

let g:ycm_autoclose_preview_window_after_completion=1

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'

" Use coc.vim for latex and yaml
let g:ycm_filetype_blacklist={
      \ 'tex': 1,
      \ 'yaml': 1
      \}

" Others
" ------------------------------------------

" Exit insert mode with a quick jk
cnoremap jk <C-C>
inoremap jk <esc>

" Clipboard
set clipboard=unnamedplus

" Highlight current line
" set cursorline

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" Turn of the wild menu
" set wildmenu  " To enable
let g:wildmenu=0

" Always show current position
set ruler

" Highlith all matches for search pattern as we type
set is

" Height of the command bar
set cmdheight=1

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

" Display relative number
set relativenumber

" Always show line numbers
set number

" Set show matching parenthesis
set showmatch

" Use many much levels of undo
set undolevels=1000

" Prevents the ability of copying and pasting out of vim with readable characters
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

" Indent comments starting with #
set cindent cinkeys-=0#
