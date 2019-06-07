#!/bin/sh

# download and execute this script
# wget -O - -https://raw.githubusercontent.com/cbettinger/dotfiles/master/alpine/setup.sh | sh

# download and install shell scripts
wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/alpine/users
install -m=+x users /usr/local/bin

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/alpine/version
install -m=+x version /usr/local/bin

# remove MOTD
cat /dev/null > /etc/motd

# update and upgrade packages
apk update
apk upgrade

# install basic tools
apk add sudo mc zip unzip p7zip neofetch htop

# install development tools
apk add cloc git nodejs npm
npm update -g npm

# create user
adduser -D cb
addgroup cb wheel

# cleanup
rm -f users version
