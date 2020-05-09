#!/bin/bash

function initialize {
    BASE=$(dirname "${BASH_SOURCE[0]}")
    BACKUP_DIR=$BASE/.backup/dotfiles_$(date +"%Y-%m-%d")_$RANDOM
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
cd $BASE
for SRC in *.symlink; do
    DST=$HOME/$(echo .$SRC|sed 's/\.symlink//')
    backup_if_exists $DST
    ln -s $BASE/$SRC $DST
done

install_plugins
