# Lightdm

## Appearance

Install webkit2 greeter:
``` zsh
sudo pacman -S lightdm-webkit2-greeter
```

Check installation:
``` zsh
ls -1 /usr/share/xgreeters/

# output:
lightdm-webkit2-greeter.desktop
```

Enable lightdm:
```
sudo systemctl enable lightdm
```

Reboot machine.


## Keymap & Login Issues

Lightdm uses Xorg's keyboard settings. 
This means if your password contains UTF-8 characters, 
you'll need to configure Xorg keyboard settings.

Otherwise, lightdm will use US keyboard layout by default.

create `/etc/X11/xorg.conf.d/00-keyboard.conf`

and paste this in, for slovene layout.
``` xf86conf
Section "InputClass"
	Identifier "keyboard"
	MatchIsKeyboard "yes"
	Option "XkbLayout" "si"
EndSection
```

More info [here](https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration#Setting_keyboard_layout).

## Random Black Screens

It may happen that lightdm will not start due to limited number of retries.
To fix this add StartLimit\* fields to `[Unit]` and Restart\* fields to `[Service]`. 

Edit file with:
```
sudo -E nvim /lib/systemd/system/lightdm.service
```

File contents:
``` ini
[Unit]
Description=Light Display Manager
Documentation=man:lightdm(1)
Conflicts=getty@tty1.service
After=getty@tty1.service systemd-user-sessions.service plymouth-quit.service acpid.service
StartLimitInterval=70
StartLimitBurst=60

[Service]
ExecStart=/usr/bin/lightdm
Restart=always
IgnoreSIGPIPE=no
BusName=org.freedesktop.DisplayManager
RestartSec=1

[Install]
Alias=display-manager.service
```

## Troubleshooting

Debug lightdm:
``` zsh
journalctl -b --unit lightdm
```

