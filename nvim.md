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

## CoC Plugin

Awesome guide here https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/

Install yarn & ripgrep.

``` zsh
sudo pacman -S yarn ripgrep
```

Install coc utils in vim, if necessary.

```zsh
:call coc#util#install()
```

Install extensions in NeoVim.

```
:CocInstall coc-tsserver coc-prettier coc-eslint coc-html coc-css coc-json coc-angular
```

Add coc config to NeoVim ($HOME/.config/nvim/coc-settings.json).

```json
{
  "suggest.echodocSupport": true,
  "suggest.maxCompleteItemCount": 20,
  "coc.preferences.formatOnSaveFiletypes": ["javascript", "typescript", "typescriptreact", "json", "javascriptreact", "typescript.tsx"],
  "eslint.filetypes": ["javascript", "typescript", "typescriptreact", "javascriptreact", "typescript.tsx"],
  "diagnostic.errorSign": "•",
  "diagnostic.warningSign": "•",
  "diagnostic.infoSign": "•"
}
```
