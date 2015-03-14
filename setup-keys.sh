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

# Fetch keys & auth files and deploy
cd $KEYS_TMP_DIR
echo -n "Keys & auth files URL: " && read URL
curl -sS "$URL" | openssl aes-256-cbc -d | tar zxf -
for SRC in .??*; do
    DST=$HOME/$SRC
    backup_if_exists $DST
    mv $SRC $DST
done
