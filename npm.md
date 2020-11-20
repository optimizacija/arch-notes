# NPM

## Configuring Global Packages

Create folder which will hold all globally installed npm packages

```
mkdir ${HOME}/.config/npm-packages
```

Source this with zsh.

``` zsh
#!/bin/zsh

## NPM

# path to global npm packages directory
NPM_PACKAGES="${HOME}/.config/npm-packages"

# node should discover global npm packages
NODE_PATH="${NPM_PACKAGES}/lib/node_modules:$NODE_PATH"

# system should discover global & executable npm packages
PATH="$NPM_PACKAGES/bin:$PATH"

# man pages that are installed with npm packages should be discoverable
unset MANPATH
MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"
```

Create `$HOME/.npmrc` and edit the file.
```
prefix=${HOME}/.config/npm-packages
```
