# NeoVim

Install neovim with pacman.
``` zsh
sudo pacman -S neovim
```

Install vim-plug with yay.
``` zsh
yay -S vim-plug
```

Download vim config from github.
``` zsh
cd "$HOME/repos/"
git clone https://github.com/optimizacija/neovim-config.git

mkdir -p "$HOME/.config/nvim/"
cp "$HOME/repos/neovim-config/init.vim" "$HOME/.config/nvim/init.vim"
```

Install NeoVim plugins with vim-plug:
```
:PlugInstall
```
