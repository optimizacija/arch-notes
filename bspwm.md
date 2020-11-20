# Bspwm

Install bpswm with pacman.
``` zsh
sudo pacman -S bspwm
```

Current bspwm config:
``` zsh
#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

bspc monitor -d I II III IV V VI VII VIII IX X

bspc config border_width         1
bspc config window_gap           6
bspc config normal_border_color  \#292d3e
bspc config focused_border_color \#c792ea

bspc config split_ratio          0.50
bspc config borderless_monocle   true
bspc config single_monocle       true
bspc config gapless_monocle      true

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

# polybar
# kill previous instance(s)
killall -q polybar
# create a new instance
polybar palenight-bar 2>/tmp/polybar.error &

# background
feh --bg-max "$HOME/images/wallpapers/0277.jpg"
```
