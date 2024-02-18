#!/bin/sh
set -xe

# nodebrew
./scripts/node.sh

# neovim
./scripts/nvim.sh

# peco
./scripts/peco.sh

# direnv
./scripts/direnv.sh

# exa
./scripts/exa.sh

# zgen
if [ ! -e "$HOME/.zgen" ]; then
	git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

# fzf
if [ ! -e "$HOME/.fzf" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --no-completion --no-key-bindings --no-update-rc
fi

# lazygit
./scripts/lazygit.sh

# brew bundle
if [ "$(uname)" = "Darwin" ]; then
	brew bundle --file=./.Brewfile
fi
