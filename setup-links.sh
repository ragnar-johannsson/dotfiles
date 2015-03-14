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

# Main
initialize "$@"

# Symlink dotfiles
for SRC in *.symlink; do
    DST=$HOME/$(echo .$SRC|sed 's/\.symlink//')
    backup_if_exists $DST
    ln -s $BASE/$SRC $DST
done

