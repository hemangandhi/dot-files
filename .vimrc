set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------Plugins-------
"Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'gcmt/breeze.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
Plugin 'rust-lang/rust.vim'

" Color Themes
Plugin 'flazz/vim-colorschemes'

call vundle#end()

filetype plugin indent on

"Doug changes
set term=screen-256color
set t_Co=256
setlocal foldmethod=syntax

colorscheme Monokai

let mapleader = ','
"make my old thing happier.
let g:jedi#rename_command = "<leader>c"

if has('autocmd')
  filetype plugin indent on
  autocmd BufEnter * silent! lcd %:p:h
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
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
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
nnoremap <Leader>n :nohl<CR>

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

" FIXME: (broken) ctrl s to save
" noremap  <C-S> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <Esc>:update<CR>

set fileformats=unix,dos,mac
set directory=$HOME/.vim/swapfiles//

let &undodir="$HOME/.vim/undodir/"
set undofile

" exit insert mode
inoremap <Leader>e <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" NERDTree
" nnoremap <Leader>t :NERDTreeToggle<CR>
" let NERDTreeHijackNetrw=1

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Syntastic
let g:syntastic_rust_checkers = ["cargo"]

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
" map <C-f> /
" " indend / deindent after selecting the text with (⇧ v), (.) to repeat.
" vnoremap <Tab> >
" vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
" vmap <C-m> gc
" " Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
"vmap <C-x> d
"vmap <C-v> p
"vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" nnoremap <C-z>  :undo<CR>
" inoremap <C-z>  <Esc>:undo<CR>
" nnoremap <C-y>  :redo<CR>
" inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
" nnoremap <C-b>  :tabprevious<CR>
" inoremap <C-b>  <Esc>:tabprevious<CR>i
" nnoremap <C-n>  :tabnext<CR>
" inoremap <C-n>  <Esc>:tabnext<CR>i
" nnoremap <C-t>  :tabnew<CR>
" inoremap <C-t>  <Esc>:tabnew<CR>i
" nnoremap <C-x>  :tabclose<CR>
" inoremap <C-x>  <Esc>:tabclose<CR>i

" lazy ':'
nnoremap ; :

nnoremap <Leader><tab> :set tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :wq<CR>
inoremap <Leader>w <ESC>:w<CR>a
inoremap <Leader>r <ESC>:wq<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
nnoremap <Leader>m :set mouse=a<CR>
nnoremap <Leader>M :set mouse=""<CR>
" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" hi Normal guibg=None ctermbg=None
