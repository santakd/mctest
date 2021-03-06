#!/bin/bash

#
# Default setups
#

# install default tools
sudo apt-get update
sudo apt-get -y install tmux git curl telnet

# init git
curl https://raw.githubusercontent.com/kazunori279/dotfiles/master/gitconfig -o ~/.gitconfig
mkdir ~/git
git init

# init go
mkdir ~/go
curl https://raw.githubusercontent.com/kazunori279/dotfiles/master/bash_profile -o ~/.bash_profile
curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz -o /tmp/golang.tar.gz
sudo tar -C /usr/local -xzf /tmp/golang.tar.gz
source ~/.bash_profile

# install mctest
cd ~/git
git clone https://github.com/kazunori279/mctest.git
go get github.com/bradfitz/gomemcache/memcache
go get github.com/montanaflynn/stats

# specify the following on metadata server with a key "startup-script"
# su -c  "go run ~/git/mctest/mctest.go > ~/mctest.log" - <username>

