#!/bin/bash

windows=$(bspc query -N -n .window.!hidden)
parent=$(bspc query -D -d --names | awk '{print $1}')
focused_desktop=$(bspc query -D -d)


if [[ $1 = "info" ]];then
    nodes=$windows

    if [[ $2 = "marked" ]];then
        nodes=$(bspc query -N -n .marked)
    fi
    
    if [[ $2 = "sticky" ]];then
        nodes=$(bspc query -N -n .sticky)
    fi

    if [[ $2 = "locked" ]];then
        nodes=$(bspc query -N -n .locked)
    fi

    if [[ $2 = "hidden" ]];then
        nodes=$(bspc query -N -n .window.hidden)
    fi

    for node in $nodes;do
        info=$(xprop -id "$node" WM_NAME | sed 's/.*=//' | sed 's/\"//g' 2>/dev/null)
        desktop=$(bspc query -D -n $node --names)

        if [[ $focused_desktop = $(bspc query -D -n "$node") ]];then
            printf "* %10s | %s\n" "$desktop" "$info"
        else
            printf "  %10s | %s\n" "$desktop" "$info"
        fi
    done

    exit
fi

if [[ $1 = "class" ]];then
        windows=$(bspc query -N -n .local.window)
        
        for window in $windows;do
            wm_class=$(xprop -id "$window" WM_CLASS | awk '{ print $3 }' | sed 's/[\",]//g')
            
            if [[ -z $2 ]];then
                printf "%s\n" "$wm_class"
            else
                if [[ $2 = $wm_class ]];then
                    echo "$window"
                    exit 1
                fi
            fi
        done

        exit 0
fi
