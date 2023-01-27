#!/bin/bash

f=$(bspc query -N -n .window.local.floating.!sticky)

for w in $f;do
    bspc node "$w" -l below
done

if [[ -n $(bspc query -N -n $(bspc query -N -n).floating) ]];then
    bspc node -f last.local.!floating.!hidden.!locked.window
    exit
fi

bspc node -f next.local.!hidden.window.!floating.!locked
