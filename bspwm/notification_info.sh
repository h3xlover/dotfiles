#!/bin/bash

if [[ $1 = "all" ]];then
    #calendar
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:cal "$(cal) "
    #desktops
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:desktops "$(printf "desktops:\n$(~/dotfiles/bspwm/desktops.sh query | sort)") "
    #windows
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:windows "$(printf "windows:\n$(~/dotfiles/bspwm/nodes.sh info | sort)\nhidden:\n$(~/dotfiles/bspwm/nodes.sh info hidden | sort)") " 
    marked=$(~/dotfiles/bspwm/nodes.sh info marked)
    sticky=$(~/dotfiles/bspwm/nodes.sh info sticky)
    locked=$(~/dotfiles/bspwm/nodes.sh info locked)
    #flags
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:flags "$(printf "marked:\n$marked\nsticky:\n$sticky\nlocked:\n$locked")"
    exit
fi

if [[ $1 = "test" ]];then
    
    c=$(cal)
    d=$(~/dotfiles/bspwm/desktops.sh query | sort)
    pr=$(printf "\t$c\t$d\t")
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:test "$pr"
    exit
fi

if [[ $1 = "cal" ]];then
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:cal "$(cal) "
    exit
fi

if [[ $1 = "desktops" ]];then
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:desktops "$(printf "desktops:\n$(~/dotfiles/bspwm/desktops.sh query | sort)") "
    exit
fi

if [[ $1 = "date" ]];then
    top=$(top -b -n 1 | grep %Cpu)
    us=$(echo $top | awk '{ print $2 }' | sed 's/\.//')
    sy=$(echo $top | awk '{ print $4 }' | sed 's/\.//')
    avg=$(($us + $sy))

    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:date "$(date "+%d/%m %a/%h %H:%M:%S") mem: $(free -m | grep Mem: | awk '{print $3}') cpu: $(($avg / 10)).$(($avg % 10))"
    #$(sensors | grep Tctl | sed 's/[^0-9.°C]//g')"
    exit
fi

if [[ $1 = "windows" ]];then
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:windows "$(printf "windows:\n$(~/dotfiles/bspwm/nodes.sh info | sort)\nhidden:\n$(~/dotfiles/bspwm/nodes.sh info hidden | sort)") " 
    exit
fi

if [[ $1 = "volume" ]];then
    volume=$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]//g')
    mute=$(amixer get Master | tail -1 | awk '{print $6}')
    sink_name=$(pactl get-default-sink | sed 's/\./ /g' | awk '{print $NF}')

    if [[ $mute = "[on]" ]];then
        mute=
    fi
    dunstify -t 1000 -h string:bgcolor:#000000 -h string:hlcolor:#6F0000 -h string:frcolor:#000000 -h string:x-dunst-stack-tag:volume -h int:value:"$volume" "$(printf "$sink_name\n$volume $mute")"
    exit
fi

if [[ $1 = "song" ]];then
    mocp -i
    err=$(echo $?)

    if [[ $err -eq 2 ]];then
        exit
    fi

    music=$(mocp -i | grep ^Title | sed 's/Title: //')
    total=$(mocp -i | grep TotalTime: | sed 's/TotalTime: //')
    current=$(mocp -i | grep CurrentTime: | sed 's/CurrentTime: //')
    
    if [[ $2 = "temp" ]];then
        c="dunstify -t 2000"
    else
        c="dunstify"
    fi
    $c -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:song "$(printf "$music\n$current/$total")"

    exit
fi

if [[ $1 = "flags" ]];then
    marked=$(~/dotfiles/bspwm/nodes.sh info marked)
    sticky=$(~/dotfiles/bspwm/nodes.sh info sticky)
    locked=$(~/dotfiles/bspwm/nodes.sh info locked)
    
    dunstify -h string:bgcolor:#000000 -h string:x-dunst-stack-tag:flags "$(printf "marked:\n$marked\nsticky:\n$sticky\nlocked:\n$locked")"
    exit
fi
