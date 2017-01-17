#! /usr/bin/sh

cp ~/.tmux.conf .
#cp -r ~/.vim .
cp ~/.vimrc .

cp -r ~/.ssh .

cp -r ~/.vim/ftplugin .

git add -A
git commit -m "$1"
git push
