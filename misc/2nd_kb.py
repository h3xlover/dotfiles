import os
from evdev import InputDevice, categorize, ecodes
dev = InputDevice('/dev/input/event19')
dev.grab()

for event in dev.read_loop():
    if event.type == ecodes.EV_KEY:
        key = categorize(event)
        if key.keystate == key.key_down:
            if key.keycode == 'KEY_F':
                os.system('swaymsg exec alacritty')
            if key.keycode == 'KEY_E':
                os.system('swaymsg exec emacs')
            if key.keycode == 'KEY_C':
                os.system('swaymsg exec ch')
            if key.keycode == 'KEY_R':
                os.system('swaymsg exec -- alacritty --class ranger -T ranger -e ~/dotfiles/bspwm/ranger')
            if key.keycode == 'KEY_D':
                os.system('swaymsg exec ~/dotfiles/bspwm/dmenu_run')
            if key.keycode == 'KEY_Z':
                os.system('swaymsg exec loginctl poweroff')
            if key.keycode == 'KEY_X':
                os.system('swaymsg exec loginctl reboot')
            if key.keycode == 'KEY_ENTER':
                os.system('swaymsg exit')
            if key.keycode == 'KEY_SPACE':
                os.system('swaymsg exec ~/dotfiles/sway/floating toggle')
            if key.keycode == 'KEY_J':
                os.system('exec ~/dotfiles/sway/move left')
            if key.keycode == 'KEY_K':
                os.system('exec ~/dotfiles/sway/move down')
            if key.keycode == 'KEY_L':
                os.system('exec ~/dotfiles/sway/move right')
            if key.keycode == 'KEY_I':
                os.system('exec ~/dotfiles/sway/move up')
            if key.keycode == 'KEY_1':
                os.system('exec ~/dotfiles/sway/floating select 1')
            if key.keycode == 'KEY_2':
                os.system('exec ~/dotfiles/sway/floating select 2')
            if key.keycode == 'KEY_3':
                os.system('exec ~/dotfiles/sway/floating select 3')
            if key.keycode == 'KEY_4':
                os.system('exec ~/dotfiles/sway/floating select 4')
            if key.keycode == 'KEY_COMMA':
                os.system('swaymsg exec ~/dotfiles/smart/light toggle')
            if key.keycode == 'KEY_DOT':
                os.system('exec ~/dotfiles/smart/light temp 153')
            if key.keycode == 'KEY_SLASH':
                os.system('exec ~/dotfiles/smart/light color $(cat ~/dotfiles/smart/colors | ~/dotfiles/bspwm/dmenu -p color)')
            if key.keycode == 'KEY_Q':
                os.system('swaymsg kill')
