#!/bin/bash

names=$(bspc query -D --names)
name=$(bspc query -D -d --names)
parent=$(echo "$name" | awk '{print $1}')
wname=$(echo "$name" | awk '{print $2}')

if [[ $1 = "add" ]];then
    random=$(echo $RANDOM)
    bspc monitor -a "$parent $random"
    bspc desktop -f "$parent $random"
    exit
fi
            
if [[ $1 = "toggle" ]];then
    if [[ -z $(echo $name | grep \ ) ]];then
        next=$(bspc query -D -d last --names)
        if [[ -n $(echo $next | grep "$parent ") ]];then
            bspc desktop -f "$next"
            exit
        fi
        next=$(echo "$names" | grep "$parent "| awk 'NR==1 {print}')
        bspc desktop -f "$next"
        exit
    fi

    mod=$(echo "$names" | grep "$parent "| awk '{print NR}' | sed '$!d')
    current=$(echo "$names" | grep "$parent "| awk '{print NR, $2}' | grep "$wname"$ | awk '{print $1}')

    if [[ $2 = "previous" ]];then
        case $current in
            $mod)
                expr=$(expr $current - 1);;
            1)
                expr=$(echo $mod);;
            *)
                expr=$(expr "$current" % "$mod" - 1);;
        esac
        next=$(echo "$names" | grep "$parent "| awk "NR==$(echo $expr){print}")
    else
        next=$(echo "$names" | grep "$parent "| awk "NR==$(expr "$current" % "$mod" + 1){print}")
    fi

    bspc desktop -f "$next"
    exit
fi

if [[ $1 = "focus" ]];then
    parent=$(echo "$name" | grep \ | awk '{print $1}')
    if [[ -n $parent ]];then
        echo "$name" > /tmp/bspwm/$parent
    fi

    if [[ $2 = "parent" ]];then
        bspc desktop -f $3
        exit
    fi

    if [[ -n $2 ]];then
        next=$(echo "$2" | sed "s/[^0-9]//g")
        next=$(cat /tmp/bspwm/$next)
        bspc desktop -f "$next"
        exit
    fi
fi

if [[ $1 = "send" ]];then
    parent=$(bspc query -D -d --names | awk '{print $1}' | sed 's/-//')
    rofi=$(bspc query -D --names | grep "$parent[ -]"|awk '{print $2}' | dmenu -sb "#000000" -sf red -sb "#3f0000" -l 15 -p send)
    if [[ -z $rofi ]];then
        exit
    fi
    next=$(bspc query -D --names | grep ^"$parent[ -]" | grep $rofi$)
    bspc node -d "$next"
    exit
fi

if [[ $1 = "rename" ]];then
    rofi=$(dmenu -sb "#000000" -sf red -sb "#3f0000" -l 15 -p rename) 
    if [[ -z $rofi ]];then
        exit
    fi
    if [[ -n $(bspc query -D -d --names | grep _-) ]];then
        name="$rofi$(bspc query -D -d --names | sed 's/^.*_-/_-/')"
    else
        name="$rofi"
    fi
    bspc desktop -n "$parent $name"
    exit
fi

if [[ $1 = "query" ]];then
    desktops=$(bspc query -D)
    focused_desktop=$(bspc query -D -d)
    for desktop in $desktops; do
        desktop_name=$(bspc query -D -d $desktop --names)
        if [[ -z $(echo $desktop_name | awk '{print $2}') ]];then
            continue
        fi
        if [[ "$desktop" = "$focused_desktop" ]];then
            printf "* %s\n" "$desktop_name"
        else
            printf "  %s\n" "$desktop_name"
        fi
    done
    exit
fi

parent=$(bspc query -D -d --names | awk '{print $1}' | sed 's/-//')
rofi=$(bspc query -D --names | grep "$parent[ -]"| awk '{print $2}' | dmenu -sb "#000000" -sf red -sb "#3f0000" -l 15 -p del)

if [[ -z $rofi ]];then
    exit
fi

next=$(bspc query -D --names | grep ^"$parent[ -]" | grep $rofi$)
bspc desktop "$next" -r
