# Sxhkd

Install sxhkd with pacman.
```
sudo pacman -S sxhkd
```

Copy sxhkd's default config to ~/.config folder with proper file permissions.
```
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc "$HOME/.config/sxhkd/sxhkdrc"
```

## Binding NON-ANSI Keys

Even non ANSI characters can be bound to actions in sxhkdrc.
The problem is that we cannot use their utf-8 representations directly.
We must use their attributed keysym names.

For example, we can bind slovene character `č` to echo "Hello World",
by using word `ccaron` instead.

``` conf
# use ccaron instead of č
super + ccaron
    echo "Hello World"
```

To get the keysym name for desired key, install & open *xev* program in the terminal.
Press desired keys while being focues on xev's GUI window. 
This will log the keysym name to the terminal, with some additional information.

Example output:

```
KeyPress event, serial 33, synthetic NO, window 0x3600001,
    root 0x7cc, subw 0x0, time 2364625, (387,166), root:(1829,722),
    state 0x0, keycode 47 (keysym 0x1e8, ccaron), same_screen YES,
    XLookupString gives 2 bytes: (c4 8d) "č"
    XmbLookupString gives 2 bytes: (c4 8d) "č"
    XFilterEvent returns: False
``` 

## Screenshots

Screenshotting can be realised by using the scrot command. Install it with pacman.
```
sudo pacman -S scrot
```

Create a screenshot folder where scrot will store its screenshots:
```
mkdir -p "$HOME/images/screenshots"
```

Add this command to enter scrot's selection mode upon pressing *super + x*.

```
# screenshot in select mode & copy screenshot to clipboard
super + x
     sleep 1 && scrot --silent --select "$HOME/images/screenshots/screenshot-$(date +%F_%T).png" -e 'xclip -selection c -t image/png < $f'
```

This command will save the screnshot as PNG image in our screenshots folder.
Additionally it will copy the image to the clipboard, so that it can be pasted elsewhere.

Install xclip with pacman if necessary.
```
sudo pacman -S xclip
```
