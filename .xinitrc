xrdb -merge ~/.Xresources
compton -cb --config ~/.compton.conf

feh -D 60 --randomize --bg-scale ~/.config/backgrounds/*

exec xmonad
xmobar &


