#!/bin/sh
set -xe

if [ "$(go version)" ]; then
  echo "go is already installed."
  exit 0
fi


if [ "$(uname)" = "Darwin" ]; then
  brew install go
else
  sudo add-apt-repository ppa:longsleep/golang-backports
  sudo apt -y install golang-go
fi
