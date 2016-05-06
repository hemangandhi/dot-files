set nu "line numbers
set cursorline
hi CursorLine cterm=bold "highlight cursorline and line number
hi CursorLineNR cterm=bold ctermbg=cyan
set ruler
syntax on
filetype plugin indent on
set autoindent
set hlsearch "highlight search
set incsearch "incremental search
set confirm "confirm on save without write
set wildmenu
set wildmode=longest,list

set expandtab "\t = 8 spaces
set smarttab "but backspaces are nice...

"Better paren highlights
hi matchParen cterm=None ctermbg=yellow ctermfg=black
"highlight status bar
highlight StatusLine ctermfg=yellow ctermbg=blue

"move about tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

let mapleader = "," "make ':' = ','
let g:mapleader = ","

",w = save, ,r is save and quit
map <leader>w :w!<cr>
map <leader>q :q<cr>
map <leader>r :wq<cr>
",ss is spelling
map <leader>ss :setlocal spell!<cr>
imap <leader>ss <esc>:setlocal spell!<cr>a
",space is no highlight
nnoremap <leader><space> :nohlsearch<cr>
",e is escape
inoremap <leader>e <esc>

inoremap <leader>w <esc>:w<cr>a
inoremap <leader>r <esc>:wq<cr>
	
"test code...
function! RunStuff()
	if match(expand("%"), '.py$') != -1
		exec ":!python3 -i " . expand("%:p")
	elseif match(expand("%"), '.c$') != -1
		exec ":!gcc -Wall " . expand("%:p")
		let l:yes = input("Enter y to run the executable > ")
		if yes == "y"
			let l:args = input("Enter any command line args: ")
			exec ":!./a.out " . args
		endif
	elseif match(expand("%"), '.clj$') != -1
		exec ":!clojure " . expand("%:p")
	endif
endfunction
map <leader>t :call RunStuff()<cr>
imap <leader>y <leader>e<leader>w<leader>t
map <leader>y <leader>w<leader>t

"Push stuff to git.
function! GitPush()
	exec ":! git add ."
	let l:mess = input("Commit message > ")
	exec ':!git commit -m "' . mess . '"'
	exec ":!git push"
endfunction
map <leader>gp :call GitPush()<cr>

"Enter any command
map <leader>c :!
imap <leader>c <esc>:!

"misspelled words' highlighting
hi clear SpellBad
hi SpellBad ctermbg=white ctermfg=black

"Drag visuals
runtime dragvisuals/dragvisuals.vim

vmap <expr> H DVB_Drag('left')
vmap <expr> J DVB_Drag('down')
vmap <expr> K DVB_Drag('up')
vmap <expr> L DVB_Drag('right')
vmap <expr> D DVB_Duplicate()

set nolist

"status line!
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2

"better background
set background=dark

"vertical split map...
map <leader>p :vsp 
imap <leader>p <esc>:vsp

"horiz split...
map <leader>h :sp
imap <leader>h <esc>:sp

let g:lisp_rainbow = 1 "rainbow parens!

"paste...
imap <leader>v <esc>"*pG$a
map <leader>v "*pG$

"copy...
imap <leader>x <esc>"+yya
map <leader>x "+yy
vnoremap <leader>x "+y

"auto read
set autoread

imap <leader>o <C-o>
