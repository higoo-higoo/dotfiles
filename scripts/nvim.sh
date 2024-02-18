#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
	brew install neovim
else
	# sudo apt install neovim
	sudo apt-get install ripgrep
	sudo apt install unzip
	sudo apt install clang-format
	curl https://sh.rustup.rs -sSf | sh
	cargo install stylua
fi

# packerがインストールされているか
if [ ! -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
