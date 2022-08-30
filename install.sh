#!/bin/sh

if [ -n $GITPOD_WORKSPACE_ID ]; then
    echo "Installing for Gitpod"
    sudo add-apt-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt install -y fish
    sudo chsh -s /usr/bin/fish gitpod
fi