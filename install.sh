#!/bin/bash

mkdir -pv ~/.config/{bspwm,sxhkd,htop,ranger,polybar,picom,alacritty}

cp ~/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
cp ~/dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

cp ~/dotfiles/htop/htoprc ~/.config/htop/htoprc

cp ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
cp ~/dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf

cp ~/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
cp ~/dotfiles/polybar/config.template ~/.config/polybar/config.template

cp ~/dotfiles/picom/picom.conf ~/.config/picom/picom.conf

cp ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo config moved
sleep 1

pip install pywal --break-system-packages
echo "add /.local/bin/ to PATH and wal to bashrc"
sleep 5

# TODO make tabbed dmenu st overlay, emacs

# mandatory

sudo su
base="eselect-repository portage-utils gentoolkit"
emerge -v $base --noreplace

# xwinwrap (edgets)
repo=$(eselect repository list | grep edgets | sed 's/[^0-9]//g')
eselect repository enable $repo

# wmutils (spikyatlinux)
repo=$(eselect repository list | grep spikyatlinux | sed 's/[^0-9]//g')
eselect repository enable $repo

echo "x11-misc/xwinwrap **" > /etc/portage/package.accept_keywords/xwinwrap
echo "x11-wm/wmutils **" > /etc/portage/package.accept_keywords/wmutils
emerge --sync

# bspwmrc
bspwmrc="feh dev-python/pip mpv picom xsetroot xwinwrap dev-python/pip unclutter-xfixes polybar imagemagick"
emerge -v $bspwmrc --noreplace

# windows
wm="x11-wm/wmutils xprop xset alacritty xdotool setxkbmap x11-misc/xclip scrot flameshot ranger zathura zathura-pdf-poppler"
emerge -v $wm --noreplace
