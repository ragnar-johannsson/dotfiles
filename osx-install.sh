#!/bin/bash

# Xcode CLI tools
xcode-select --install

# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Brews
cat << EOF | xargs -n 1 brew install
ack
arping
at-spi2-atk
at-spi2-core
atk
autoconf
automake
bazaar
brew-cask
cairo
check
cloog-ppl015
cmake
d-bus
dhcping
docker
duplicity
duply
ec2-api-tools
eigen
exiftool
faac
ffmpeg
fontconfig
fontforge
freetype
gdbm
gdk-pixbuf
gettext
git
git-extras
glib
gmp4
gnupg
go
gobject-introspection
gtk+3
harfbuzz
hping
htop-osx
httping
icu4c
iftop
imagesnap
intltool
ioping
jasper
jpeg
jsl
json-glib
lame
libconfig
libffi
libgee
libgpg-error
libksba
libmpc08
libnet
libogg
libpng
librsync
libsodium
libtiff
libtool
libtoxcore
libvorbis
libvpx
libyaml
mercurial
mpfr2
mplayer
mpssh
mtr
neon
nmap
node
opencv
openssl
p7zip
pango
parallel
pcre
phantomjs
pixman
pkg-config
popt
ppl011
pssh
pyenv
pyenv-virtualenv
rbenv
readline
redis
ruby
ruby-build
s3cmd
samba
serf
sqlite
ssh-copy-id
subversion
texi2html
tig
tree
unrar
vala
venom
vim
wget
winexe
x264
xvid
xz
yasm
youtube-dl
zsh
EOF

# Homebrew Cask
brew tap phinze/cask
brew install brew-cask

# Casks
cat << EOF | xargs -n 1 brew cask install
bonjour-browser
chefdk
chicken
cord
cyberduck
eclipse-ide
firefox
gimp
google-chrome
hipchat
iterm2
mactex
mou
openoffice
poison
truecrypt
tunnelblick
utorrent
vagrant
virtualbox
vlc
vmware-fusion
xquartz
EOF

# NPM packages
cat << EOF | xargs -n 1 sudo npm install -g
bower
express
grunt-cli
jshint
keybase
EOF

# Ruby RVM
curl -sSL https://get.rvm.io | bash

# Meslo Font
test -d $HOME/Library/Fonts || mkdir $HOME/Library/Fonts
curl -3 -o "$HOME/Library/Fonts/Meslo LG M Regular for Powerline.otf" https://raw.githubusercontent.com/Lokaltog/powerline-fonts/master/Meslo/Meslo%20LG%20M%20Regular%20for%20Powerline.otf > /dev/null 2>&1
