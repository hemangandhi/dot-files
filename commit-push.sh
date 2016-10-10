#! /usr/bin/sh

cp ~/.tmux.conf .
cp -r ~/.vim .
cp ~/.vimrc .

cp -r ~/.ssh .

git add -A
git commit -m "$1"
git push
