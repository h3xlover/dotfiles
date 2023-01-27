#!/bin/bash

f=$(bspc query -N -n .window.local.floating)

for w in $f;do
    bspc node "$w" -l normal
done

if [[ $1 = "previous" ]];then
    bspc node -f prev.local.!hidden.window.floating
    exit
fi

if [[ -n $1 ]];then
    bspc node "$1" -f
    exit
fi

if [[ -n $(bspc query -N -n $(bspc query -N -n).tiled) ]];then
    bspc node -f last.local.floating.!hidden.window.normal
    exit
fi

bspc node -f next.local.!hidden.window.floating
