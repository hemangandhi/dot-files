xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
compton -cb

feh -D 60 --randomize --bg-scale ~/.config/backgrounds/*
exec i3

