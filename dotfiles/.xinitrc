#!/bin/sh

mon="$(xrandr | awk '/connected/ && !/disconnected/ && /primary/ { print $1 }')"
xrandr --output $mon --mode 1920x1080 

hsetroot -solid "#7070aa"

exec xrdb &
picom --config /home/$USER/.config/picom/picom.conf --experimental-backends &
exec dwm
