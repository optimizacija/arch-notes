## Todo

Install todo.txt-cli via pacman:

```
sudo pacman -S todotxt
```

`todotxt` requires this config file to be present in the system path: `~/.todo/config`
In order not to pollute the home directory, one can specify a custom config filepath.

Create a custom `todotxt` directory with `todo.conf` config file inside the `.config/` folder.
```
mkdir -p "$HOME/.config/todotxt"
touch "$HOME/.config/todotxt/todo.conf"
```

Create an alias to load the correct config file every time.
``` zsh
alias todo='todo.sh -d "$HOME/.config/todotxt/todo.conf"'
```
