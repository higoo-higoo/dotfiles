#!/bin/sh
set -xe

if [ "$(nvim --version)" ]; then
  echo "nvim is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  brew install curl
  brew install ripgrep
  curl -Lo "$HOME/neovim.tar.gz" https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz
  xattr -c "$HOME/neovim.tar.gz"
else
  sudo apt-get -y install gettext 
  sudo apt install ripgrep
  curl -Lo "$HOME/neovim.tar.gz" https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
fi

mkdir -p "$HOME/neovim"
tar xzvf "$HOME/neovim.tar.gz" -C "$HOME/neovim" --strip-components=1
sudo mv "$HOME/neovim/bin/nvim" "/usr/local/bin/nvim"
sudo mv "$HOME/neovim/share/nvim" "/usr/local/share/nvim"
sudo mv "$HOME/neovim/lib/nvim" "/usr/local/lib/nvim"
rm -rf "$HOME/neovim.tar.gz" "$HOME/neovim"

# packerがインストールされているか
if [ ! -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
