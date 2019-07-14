# Johntron's dotfiles

Clone this repo and add a few lines to your dotfiles - stuff with a "dot" prefix like ~/.profile - to up your shell game.

## Install

1. Figure out which dotfile is sourced for non-login interactive shells - e.g. .zhrc when using zsh
2. In this file, create an environment variable referencing the [dotfiles/](dotfiles/) directory: `DOTFILES=$HOME/Development/dotfiles/dotfiles`
3. Add lines to source files under [dotfiles/](dotfiles/)

Example ~/.zshrc:

```shell
DOTFILES=$HOME/Development/dotfiles/dotfiles
source $DOTFILES/debian
source $DOTFILES/user-bin
source $DOTFILES/oh-my-zsh
source $DOTFILES/dockerized-node
source $DOTFILES/ssh
```

