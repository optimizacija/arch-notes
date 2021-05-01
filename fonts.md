# Fonts

## Installing Fonts

Download the font online, and extract the archive. You'll probably get a bunch of `.tff` files.
Move those files over to `~/.local/share/fonts/`

```zsh
# create dir if it's missing
mkdir -p "$HOME/.local/share/fonts"

mv *.tff "$HOME/.local/share/fonts"
```

## Getting Font's name

```zsh
fc-match -a | grep -i 'DejaVu Sans'
> DejaVuSans.ttf: "DejaVu Sans" "Book"
> ...
```

The name is the string in first parenthesis: `DejaVu Sans`
and its style is the string in second parenthesis: `Book`

Use these 2 strings to select the fonts in alacritty config.

