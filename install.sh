#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

FILES="fzf tern-config gitconfig hgrc vim vimrc zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

SOURCE="${BASH_SOURCE[0]}"

git submodule update --init --recursive

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

echo "Installing fuzzy finder (use with ctrl+T)..."
~/.fzf/install
echo "done"

echo -n "Install vim from source? [yN] "
read install
if echo "$install" | grep -iq "^y"; then
	echo
	echo -n "Installing vim..."
	cd vimsrc
	make distclean
	./configure --enable-pythoninterp=yes
	make
	sudo make install
	cd ..
	echo "done"
fi
