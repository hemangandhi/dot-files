xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
compton -cb --config ~/.compton.conf

feh -D 60 --randomize --bg-scale ~/.config/backgrounds/*

exec xmonad
xmobar &


