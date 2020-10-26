"esc"
inoremap jk <esc>

"arrow keys"
nnoremap j h
nnoremap k j
nnoremap i k
vnoremap j h
vnoremap k j
vnoremap i k

"searching"
set hlsearch
set incsearch
set smartcase ignorecase

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
set autoindent smartindent

set bs=indent,eol,start

set nocp

"gui settings"
set number
set laststatus=2
set lazyredraw

"editor settings
set nowrap

"don't create swp, backup files
set noswapfile
set nobackup

set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


set wildmenu wildignorecase
set wildmode=full

set list listchars=tab:·\ ,trail:·,extends:>,precedes:<

