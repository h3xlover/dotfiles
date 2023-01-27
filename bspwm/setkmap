#!/bin/bash

if [[ $1 = "reset" ]];then
    setxkbmap us
    exit
fi

kmap=$(dmenu -sb "#000000" -sf red -sb "#3f0000")

if [[ -z $kmap ]];then
    exit
fi

setxkbmap $kmap
