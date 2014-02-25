#!/bin/bash

function initialize {
    BASE=$HOME/.dotfiles
    BACKUP_DIR=$HOME/.backup/dotfiles_$(date +"%Y-%m-%d")_$RANDOM
    KEYS_TMP_DIR=$(mktemp -d -t dotfilesXXX)
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

# Fetch keys & auth files and deploy
cd $KEYS_TMP_DIR
echo -n "Keys & auth files URL: " && read URL
curl -sS "$URL" | openssl aes-256-cbc -d | tar ztf -
for SRC in $KEYS_TMP_DIR/.??*; do
    DST=$HOME/$SRC
    backup_if_exists $DST
    mv $BASE/$SRC $DST
done
