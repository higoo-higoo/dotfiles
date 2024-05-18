#!/bin/sh
set -xe

git clone --depth=1 -b v0.9.2 https://github.com/neovim/neovim ~/neovim
sudo apt-get -y install gettext
cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd - && rm -rf ~/neovim

# packerがインストールされているか
if [ ! -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
