#!/bin/sh

# download and execute this script
# wget -O - -https://raw.githubusercontent.com/cbettinger/dotfiles/master/alpine/setup.sh | sh

# download and install shell scripts
mkdir temp
cd temp

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/ubuntu/users
install -m=+rx users /usr/local/bin

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/ubuntu/wttr
install -m=+rx wttr /usr/local/bin

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/alpine/version
install -m=+rx version /usr/local/bin

cd ..
rm -rf temp

# remove MOTD
cat /dev/null > /etc/motd

# update and upgrade packages
apk update
apk upgrade

# install basic tools
apk add sudo mc openssh-client zip unzip neofetch htop aria2

# install development tools
apk add build-base cmake bison flex
apk add cloc git nodejs npm redis
npm update -g npm

# setup folder for global npm packges
mkdir /home/cb/.npm-global
echo 'prefix=~/.npm-global' >> /home/cb/.npmrc
echo 'export PATH="~/.npm-global/bin:./node_modules/.bin:$PATH"' >> /home/cb/.profile

# create user
adduser -D cb
addgroup cb wheel
passwd cb
