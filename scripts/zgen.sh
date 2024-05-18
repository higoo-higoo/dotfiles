#!/bin/sh
set -xe

if [ -e "$HOME/.zgen" ]; then
  echo "zgen is already installed."
  exit 0
fi

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
