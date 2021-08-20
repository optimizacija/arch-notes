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

## Troubleshooting

If for some reason you can't connect to wifi and don't see any wifi devices listed with `nmcli` command, 
then check if wifi is soft/hard blocked.

``` zsh
sudo rfkill list

> output: 
0: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: yes
	Hard blocked: no
```

If it's only soft blocked as shown above, then enable it via terminal.

```
sudo rfkill unblock 1
```

If it's hard blocked, it means you have to press some key on the keyboard to first unblock it via hardward.
Then also probably do the step above in the terminal.
