set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'neomake/neomake'
NeoBundle 'tpope/vim-surround'
NeoBundle 'dhruvasagar/vim-prosession', {'depends': 'tpope/vim-obsession'}
NeoBundle 'gcmt/breeze.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rust-lang/rust.vim'

" Color Themes
NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()

filetype plugin indent on

"Doug changes
"set term=screen-256color
set t_Co=256
setlocal foldmethod=syntax

colorscheme Monokai

let mapleader = ','

if has('autocmd')
  filetype plugin indent on
  autocmd BufEnter * silent! lcd %:p:h
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq


" do not history when leavy buffer
set hidden
nnoremap <Leader>n :nohl<CR>

set fileformats=unix,dos,mac
set directory=$HOME/.config/nvim/swapfiles//

let &undodir="/home/heman/.config/nvim/undodir/"
set undofile

" exit insert mode
inoremap <Leader>e <Esc>

set completeopt=menuone,longest,preview

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Syntastic
let g:syntastic_rust_checkers = ["cargo"]

" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

" lazy ':'
nnoremap ; :

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :wq<CR>
inoremap <Leader>w <ESC>:w<CR>a
inoremap <Leader>r <ESC>:wq<CR>

"Prosession
let g:prosession_dir='~/.config/nvim/sessions/'
let g:prosession_on_startup=1

NeoBundleCheck
