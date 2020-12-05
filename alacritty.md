# Alacritty

## Terminfo

When SSH-ing to another machine it might not recognize your alacritty terminal.

For a quick workaround ssh into the machine by lying about which terminal you are using.
```
env TERM=xterm-256color ssh
```

For an actual fix, ssh to remote machine and execute these commands.
```
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info
tic -xe alacritty,alacritty-direct alacritty.info
```
