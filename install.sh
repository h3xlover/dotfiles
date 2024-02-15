#!/bin/bash

echo "run as root"
sleep 10

# mandatory
base="eselect-repository portage-utils gentoolkit"
emerge -v "$base" --noreplace

# xwinwrap (edgets)
eselect repository enable 86
# wmutils (spikyatlinux)
eselect repository enable 314

echo "x11-misc/xwinwrap **" >> /etc/portage/package.accept_keywords/xwinwrap
echo "x11-wm/wmutils **" >> /etc/portage/package.accept_keywords/wmutils
emerge --sync

# bspwmrc
bspwmrc="feh pip mpv picom xsetroot xwinwrap dev-python/pip unclutter-xfixes polybar imagemagick"
emerge -v "$bspwmrc" --noreplace
pip install pywal --break-system-packages

# windows
wm="x11-wm/wmutils xprop xset alacritty xdotool setxkbmap x11-misc/xclip scrot flameshot ranger zathura zathura-pdf-poppler"
emerge -v "$wm" --noreplace

# install bspwmrc and sxhkdrc
mkdir -pv ~/.config/{bspwm,sxhkd,htop,ranger,polybar,picom,alacritty}

mv ~/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
mv ~/dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

mv ~/dotfiles/htop/htoprc ~/.config/htop/htoprc

mv ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
mv ~/dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf

mv ~/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
mv ~/dotfiles/polybar/config.template ~/.config/polybar/config.template

mv ~/dotfiles/picom/picom.conf ~/.conf/picom/picom.conf

mv ~/dotfiles/alacritty/alacritty.yml ~/.conf/alacritty/alacritty.yml

# TODO make tabbed dmenu st overlay, emacs
