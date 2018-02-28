#!/bin/bash

git submodule update --init --rebase --remote --recursive

OLDDIR=~/dotfiles_old # old dotfiles backup directory

function dotfiles() {
    FILES="fzf tern-config gitconfig hgrc vim vimrc zshrc oh-my-zsh editorconfig"    # list of files/folders to symlink in homedir
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
      DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
      SOURCE="$(readlink "$SOURCE")"
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    OLDDIR=~/dotfiles_old             # old dotfiles backup directory

    # create dotfiles_old in homedir
    echo -n "Creating $OLDDIR for backup of any existing dotfiles in ~ ..."
    mkdir -p $OLDDIR
    echo "done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    echo -n "Moving any existing dotfiles from ~ to $OLDDIR ..."
    for FILE in $FILES; do
        mv ~/.$FILE $OLDDIR 2>/dev/null
    done
    echo "done"

    echo "Creating symlinks ..."
    for FILE in $FILES; do
        if [ -L ~/.$FILE ]
        then
            echo "  Symlink ~/.$FILE > $DIR/$FILE exists, skipping"
        else
            echo -n "  + Creating ~/.$FILE > $DIR/$FILE ..."
            ln -s $DIR/$FILE ~/.$FILE
            echo "done"
        fi
    done
    echo "done"
}

function remove_old() {
    rm -rf $OLDDIR
}

function enable_256() {
    echo "export TERM=xterm-256color" >> ~/.profile
}

function install_yarn() {
    npm install -g yarn
}

function install_eslint() {
    npm install -g eslint
}

function install_editorconfig() {
    brew install editorconfig
}

function install_quicklook() {
    brew install caskroom/cask/brew-cask
    brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
}

function install_ag() {
    brew install ag
}

function install_fzf() {
    ~/.fzf/install
}

function install_vim() {
    cd vimsrc
	make distclean
	./configure --enable-pythoninterp=yes
	make
	sudo make install
	cd ..
}

function install_powerline() {
	cd powerline-fonts
	./install.sh
	cd ..
}

function install_nvm() {
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
}

function install_nodengine() {
    echo "Password for sudo may be required"
    sudo npm install -g nodengine
}

function install_lnav() {
    brew install readline
    #brew link readline --force
    cd lnav
    ./autogen.sh
    ./configure --with-readline=`brew --prefix readline` --prefix='/usr/local'
    make
    make install
    cd ..
}

function install_iterm_theme() {
    open "iTerm2-Color-Schemes/schemes/Tomorrow Night Bright.itermcolors"
}

options=""
labels=()
callbacks=()
function add() {
    echo "adding $1"
    label=$((${#callbacks[@]} + 1))
    labels+=("$1")
    options="$options $label \"$1\" yes"
    callbacks+=($2)
}

add "dotfiles" 'dotfiles'
add "remove old dotfiles" 'remove_old'
add "enable 256 colors" 'enable_256'
add "quicklook plugins" 'install_quicklook'
add "ag (silver searcher)" 'install_ag'
add "fuzzy finder" 'install_fzf'
add "eslint" 'install_eslint'
add "yarn" 'install_yarn'
add "editorconfig" 'install_editorconfig'
add "vim (from source)" 'install_vim'
add "powerline fonts" 'install_powerline'
add "nvm" 'install_nvm'
add "nodengine" 'install_nodengine'
add "log navigator (lnav)" 'install_lnav'
add "iTerm theme (Tomorrow Night Bright)" 'install_iterm_theme'

function get_selections() {
    read -d '' cmd <<- EOL
        dialog
            --stdout
            --backtitle "Choose what to install"
            --title "Choose what to install"
            --visit-items
            --checklist "Choose what to install:" 20 50 10
            $options
EOL
    eval $cmd
}

selections=".$(get_selections)"
echo

if [ "$selections" == '.' ]
then
    echo "Nothing to install"
    exit
fi

selections=${selections:1} # remove dummy prefix

for i in $selections; do
    i=$(($i - 1))
    echo "Installing ${labels[$i]} ..."
    eval ${callbacks[$i]}
    echo "... done installing ${labels[$i]}"
done
