#! /usr/bin/sh

cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.inputrc .
cp ~/.zshrc .
cp ~/.xprofile .
cp ~/.xinitrc .
cp ~/.nvidia-xinitrc .
cp ~/.Xresources .
cp ~/.Xmodmap .

cp ~/.config/compton.conf .config/
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
cp -r ~/.config/zathura .config/
cp -r ~/.config/i3 .config/
cp -r ~/.config/i3status .config/
cp ~/.config/nvim/init.vim .config/nvim/init.vim

cat ~/.muttrc | grep -v pass | grep -v spoolfile > .muttrc

git add -A
git commit -m "$1"
git push
