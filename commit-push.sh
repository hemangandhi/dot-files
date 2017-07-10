#! /usr/bin/sh

cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.inputrc .
cp ~/.zshrc .
cp ~/.xinitrc .
cp ~/.Xresources .

cp ~/.compton.conf .
cp ~/.fehbg .

cp -r ~/.ssh .

cp -r ~/.vim/ftplugin .
cp -r ~/.vim/colors .

cp -r ~/.bashrc .
cp -r ~/.bash_prompt .
cp -r ~/.bash_git .
cp -r ~/.bash_aliases .

cp ~/.emacs.d/init.el .

cp -r ~/.config/sway .config/
cp -r ~/.config/xmobar .config/
cp -r ~/.config/backgrounds .config/
cp -r ~/.xmonad .

git add -A
git commit -m "$1"
git push
