#! /usr/bin/sh

# tmux
cp ~/.tmux.conf .

# vim
cp ~/.vimrc .
cp -r ~/.vim/ftplugin .
cp -r ~/.vim/colors .

# shell
cp ~/.inputrc .
cp ~/.zshrc .
cp -r ~/.bashrc .
cp -r ~/.bash_prompt .
cp -r ~/.bash_git .
cp -r ~/.bash_aliases .

# X
cp ~/.xprofile .
cp ~/.xinitrc .
cp ~/.nvidia-xinitrc .
cp ~/.Xresources .

# keyboard
cp ~/.Xmodmap .
cp ~/trail.kmap .

# compton and backgrounds
cp ~/.config/compton.conf .config/
cp ~/.fehbg .
cp -r ~/.config/backgrounds .config/

# emacs
cp ~/.emacs.d/init.el .

# zathura
cp -r ~/.config/zathura .config/

# i3
cp -r ~/.config/i3 .config/
cp -r ~/.config/i3status .config/

# Neovim
cp ~/.config/nvim/init.vim .config/nvim/init.vim

# Yeet into git
git add -A
git commit -m "$1"
git push
