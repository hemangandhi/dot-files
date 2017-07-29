xrdb -merge ~/.Xresources
xmodpam ~/.Xmodmap
compton -cb --config ~/.compton.conf

feh -D 60 --randomize --bg-scale ~/.config/backgrounds/*

exec xmonad
xmobar &


