#! /usr/bin/sh

cp ~/.tmux.conf .
#cp -r ~/.vim .
cp ~/.vimrc .

cp -r ~/.ssh .

cp -r ~/.vim/ftplugin .

cp -r ~/.bashrc .
cp -r ~/.bash_prompt .
cp -r ~/.bash_git .

cp ~/.emacs.d/init.el .

git add -A
git commit -m "$1"
git push
