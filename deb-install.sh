#!/bin/bash

# Packages 
sudo apt-get update
cat << EOF | xargs -n 1 sudo apt-get install -y 
ack-grep
arping
build-essential
curl
duplicity
duply
ec2-api-tools
git
golang
htop
httping
iftop
ioping
mercurial
moreutils
mtr
nmap
nodejs
pssh
s3cmd
screen
subversion
vim
zsh
EOF
