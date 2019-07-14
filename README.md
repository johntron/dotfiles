# Johntron's dotfiles

Clone this repo and add a few lines to your dotfiles - stuff with a "dot" prefix like ~/.profile - to up your shell game.

## Install

1. Ensure your shell sources .profile when it starts - add something like `source $HOME/.profile` to an .*rc file
2. Add this variable to ~/.profile and point it to [dotfiles/](dotfiles/): `DOTFILES=$HOME/Development/dotfiles/dotfiles`
3. Source any of the files under [dotfiles/](dotfiles/) in your .profile

Example ~/.profile:

```shell
DOTFILES=$HOME/Development/dotfiles/dotfiles
. $DOTFILES/.profile-debian
. $DOTFILES/.profile-user-bin
. $DOTFILES/.profile-oh-my-zsh
. $DOTFILES/.profile-dockerized-node
. $DOTFILES/.profile-ssh
```

