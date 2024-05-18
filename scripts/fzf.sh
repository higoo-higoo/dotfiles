#!/bin/sh
set -xe

if [ -e "$HOME/.fzf" ]; then
  echo "fzf is already installed."
  exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-completion --no-key-bindings --no-update-rc
