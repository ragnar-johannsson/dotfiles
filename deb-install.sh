#!/bin/bash

# Packages 
apt-get update
cat << EOF | xargs -n 1 apt-get install -y
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
sudo
vim
zsh
EOF
