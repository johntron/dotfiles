export DOTFILES_STARTUP="$DOTFILES_STARTUP, zshrc"
source $DOTFILES/interactive/macos
source $DOTFILES/interactive/oh-my-zsh
source $DOTFILES/interactive/ssh-tunnel
source $DOTFILES/interactive/neovim
source $DOTFILES/interactive/spacevim
#source $DOTFILES/interactive/iterm-font-switching

if [ -f $HOME/.interactiverc ]; then
  source $HOME/.interactiverc
fi

