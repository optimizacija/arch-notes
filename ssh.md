# SSH

## ssh-agent

To run ssh-agent on start create a user's systemd service for ssh-agent.

go to `$HOME/.config/systemd/user/default.target.wants` and create a file
`ssh-agent.service`.

Insert these contents to the service file.
``` systemd
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK;

[Install]
WantedBy=default.target
```

Create `$HOME/.pam_environment` file with this line.
```
SSH_AUTH_SOCK DEFAULT="${XDG_RUNTIME_DIR}/ssh-agent.socket" 
```

Add this to one of shell scripts that are sourced on each session.
``` zsh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```
