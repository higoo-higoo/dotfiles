#!/bin/sh
set -xe

# nodebrew
if [ "$(uname)" = "Darwin" ]; then
	brew install nodebrew
	nodebrew setup
# nodeがインストールされているか
elif [ ! -e "/usr/local/bin/node" ]; then
	sudo apt update
	sudo apt -y install nodejs npm
	sudo npm install n -g
	sudo n stable
	sudo apt -y remove nodejs npm
fi
