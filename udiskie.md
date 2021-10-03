# Automounting USB devices
Install `udisks2` & `udiskie` 

```
sudo pacman -S udisks2 udiskie
```

Create a systemd service that will start udiskie on startup.

```
[Unit]
Description=Removable disk automounter using udisks

[Service]
ExecStart=/usr/bin/udiskie -aN

[Install]
WantedBy=default.target
```

Save it to `$HOME/.config/systemd/user/` so that it gets picked up by systemctl.

Enable it for current user & start it:

```
systemctl --user enable udiskie.service
systemctl --user start udiskie.service
systemctl --user status udiskie.service
```
