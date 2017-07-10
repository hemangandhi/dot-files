xrdb -merge ~/.Xresources
compton -cb --config ~/.compton.conf

feh -d 60 --randomize --bg-scal ~/.config/backgrounds/*

exec xmonad
xmobar &


