# NetworkManager

Install NetworkManager with pacman and enable it.
``` zsh
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager
```

Connect to Wifi.
``` zsh
# list devices
nmcli device wifi list

# connect to device
nmcli device wifi connect <SSID> password <PASSWORD>
```
