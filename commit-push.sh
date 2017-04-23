#! /usr/bin/sh

cp ~/.tmux.conf .
#cp -r ~/.vim .
cp ~/.vimrc .
cp ~/.inputrc .
cp ~/.zshrc

cp -r ~/.ssh .

cp -r ~/.vim/ftplugin .

cp -r ~/.bashrc .
cp -r ~/.bash_prompt .
cp -r ~/.bash_git .

cp ~/.emacs.d/init.el .

cp -r ~/.config/sway .config/
cp -r ~/.config/xmobar .config/
cp -r ~/.xmonad .

git add -A
git commit -m "$1"
git push
