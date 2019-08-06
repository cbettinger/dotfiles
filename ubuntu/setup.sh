#!/bin/sh

# download and execute this script
# curl -sL https://raw.githubusercontent.com/cbettinger/dotfiles/master/ubuntu/setup.sh | bash -

# download and install shell scripts
mkdir temp
cd temp

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/ubuntu/users
install -m=+rx users /usr/local/bin

wget https://raw.githubusercontent.com/cbettinger/dotfiles/master/ubuntu/wttr
install -m=+rx wttr /usr/local/bin

cd ..
rm -rf temp

# update and upgrade packages
apt full-upgrade
apt autoremove

# install basic tools
apt install -y mc openssh-client zip unzip screenfetch htop aria2

# install development tools
apt install -y cmake bison flex
apt install -y cloc git redis-server

curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt install -y nodejs
npm update -g npm

# build and install glencoe-solvers
git clone https://github.com/glnc/glencoe-solvers.git
cd glencoe-solvers
sh build.sh
sh install.sh
sh test.sh
cd ..
