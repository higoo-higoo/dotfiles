#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
  brew bundle --file="$HOME/.Brewfile"
fi

