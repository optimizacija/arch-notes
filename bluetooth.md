# Bluetooth

Install bluez packages with pacman. 
``` zsh
sudo pacman -S bluez bluez-utils
```

Install pulseaudio-bluetooth for bluetooth audio support with pacman.
``` zsh
sudo pacman -S pulseaudio-bluetooth
```

enable bluetoothctl systemd service.
``` zsh
sudo systemctl enable bluetooth
```

Enable Bluetooth's AutoEnable feature.
``` zsh
# > edit with:
# sudo -E nvim /etc/bluetooth/main.conf

AutoEnable=true
```
 
Add user to lp group. Not sure if this is necessary.
``` zsh
su
usermod -aG lp jan
```

Add some config to pulseaudio default config.
``` conf
# > edit with:
# sudo -E nvim /etc/pulse/default.pa

load-module module-switch-on-connect # TODO: manually added
```

Add some config to pulseaudio system config.
``` conf
# > edit with:
# sudo -E nvim /etc/pulse/system.pa

# load bluetooth modules 
load-module module-bluetooth-policy # TODO: manually added
load-module module-bluetooth-discover # TODO: manually added
```

Install pavucontrol with pacman.
``` zsh
sudo pacman -S pavucontrol
```

Start pulseaudio. Do not use systemd.
``` zsh
# > optionally kill it:
# pulseaudio -k
# > or with:
# killall pulseaudio
pulseaudio --start
```

To connect to bluetooth headphones, follow 
[instructions on Arch wiki](https://wiki.archlinux.org/index.php/bluetooth).
