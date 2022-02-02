export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:$HOME/.platformio/penv/bin

export IGN_CONFIG_PATH=/usr/local/share/ignition/

export DOTFILES_STARTUP="$DOTFILES_STARTUP, zprofile"
export DOTFILES=$HOME/Development/dotfiles
source $DOTFILES/login/user-bin
source $DOTFILES/login/default-editor-neovim

##
# Your previous /Users/johntron/.zprofile file was backed up as /Users/johntron/.zprofile.macports-saved_2020-04-17_at_13:24:10
##

# MacPorts Installer addition on 2020-04-17_at_13:24:10: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

alias gpstfu="git push --no-verify"
