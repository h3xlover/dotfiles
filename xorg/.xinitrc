xset -dpms
xset s off
xrandr --output DisplayPort-0 --primary --mode 3440x1440 --refresh 144
xrdb -merge ~/.Xresources
exec bspwm


