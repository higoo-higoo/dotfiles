#!/bin/sh
set -xe

if [ "$(nvim --version)" ]; then
  echo "nvim is already installed."
  exit 0
fi

if [ ! "$(uname)" = "Darwin" ]; then
  sudo apt-get -y install gettext 
  sudo apt install ripgrep
  brew install cmake
  brew install llvm
fi

if [ ! -d "$HOME/neovim" ]; then
  git clone --depth=1 -b v0.9.2 https://github.com/neovim/neovim ~/neovim
fi

cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd - && rm -rf ~/neovim

# packerがインストールされているか
if [ ! -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
