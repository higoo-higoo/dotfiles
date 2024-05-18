#!/bin/sh
set -xe

if [ "$(node -v)" ]; then
  echo "node is already installed."
  exit 0
fi


# nodebrew
if [ "$(uname)" = "Darwin" ]; then
	brew install nodebrew
	nodebrew setup
# nodeがインストールされているか
else
	sudo apt update
	sudo apt -y install nodejs npm
	sudo npm install n -g
	sudo n stable
	sudo apt -y remove nodejs npm
fi
