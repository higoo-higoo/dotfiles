#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
  brew install zsh
  brew install tmux
else
  sudo apt-get -y install zsh
  git clone --depth=1 https://github.com/tmux/tmux ~/tmux
  sudo apt -y install bison
  sudo apt -y install libncurses-dev
  cd ~/tmux && sudo ./autogen.sh
  sudo ./configure --prefix=/usr/local
  sudo make && sudo make install
  cd - && rm -rf ~/tmux
fi


