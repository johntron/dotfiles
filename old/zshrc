# Load .profile if it exists
if [ -f ~/.profile ]
then
    source ~/.profile
fi

# Oh my zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster" # Set theme (from ~/.oh-my-zsh/themes/)
plugins=(git colorize cp dircycle z vagrant docker github) # Plugins (from ~/.oh-my-zsh/custom/plugins/)
source $ZSH/oh-my-zsh.sh

# Z directory switcher
[ -f ~/dotfiles/z/z.sh ] && . ~/dotfiles/z/z.sh

# Fuzzy-finder
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# Functions and aliases
function tunnel {
    source_port=$1
    dest_port=${3:-$1}
    host=$2
    echo "ssh -L ${source_port}:localhost:${dest_port} ${host} -N -vv"
    ssh -L ${source_port}:localhost:${dest_port} ${host} -N -vv
}
alias vi="vim -p"
alias l="ls -al"

# added by travis gem
[ -f /Users/jsyrinek/.travis/travis.sh ] && source /Users/jsyrinek/.travis/travis.sh
