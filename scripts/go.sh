#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
  brew install go
else
  sudo add-apt-repository ppa:longsleep/golang-backports
  sudo apt -y install golang-go
fi
