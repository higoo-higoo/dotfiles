#!/bin/sh
set -xe
if [ "$(zsh --version)" ]; then
  echo "zsh is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  brew install zsh
  brew install tmux
else
  sudo apt-get -y install zsh
  git clone --depth=1 https://github.com/tmux/tmux ~/tmux
  sudo apt -y install bison libncurses-dev libevent-dev autoconf automake pkg-config
  cd ~/tmux && sudo ./autogen.sh
  sudo ./configure --prefix=/usr/local
  sudo make && sudo make install
  cd - && sudo rm -rf ~/tmux
fi
