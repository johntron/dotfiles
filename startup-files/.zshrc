export DOTFILES=$HOME/Development/dotfiles
export DOTFILES_STARTUP="$DOTFILES_STARTUP, zshrc"

if [ -f $HOME/.interactiverc ]; then
  source $HOME/.interactiverc
fi

