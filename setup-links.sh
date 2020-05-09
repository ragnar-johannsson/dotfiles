#!/bin/bash

function initialize {
    BASE=$HOME/.dotfiles
    BACKUP_DIR=$HOME/.backup/dotfiles_$(date +"%Y-%m-%d")_$RANDOM
}

function backup_if_exists {
    if [ -e "$1" ]; then
        test -d "$BACKUP_DIR" || mkdir -p "$BACKUP_DIR"
        mv $1 "$BACKUP_DIR"
    fi
}

function install_plugins {
    echo "Installing Vim plugins..."
    vim +PlugInstall +qall
    echo "Installing Zsh plugins..."
    zsh -i -c "cat /dev/null"
}

# Main
initialize "$@"

# Symlink dotfiles
for SRC in *.symlink; do
    DST=$HOME/$(echo .$SRC|sed 's/\.symlink//')
    backup_if_exists $DST
    ln -s $BASE/$SRC $DST
done

install_plugins
