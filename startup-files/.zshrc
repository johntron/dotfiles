export DOTFILES_STARTUP="$DOTFILES_STARTUP, zshrc"

if [ -f $HOME/.interactiverc ]; then
  source $HOME/.interactiverc
fi

source $DOTFILES/interactive/oh-my-zsh
source $DOTFILES/interactive/ssh-tunnel
source $DOTFILES/interactive/neovim
source $DOTFILES/interactive/spacevim

