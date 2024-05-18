#!/bin/sh
set -xe

if [ "$CHEZMOI_SOURCE_DIR" = "" ]; then
	SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
else
	SOURCE_DIR="$CHEZMOI_SOURCE_DIR"
fi

# zsh, tmux
"$SOURCE_DIR"/scripts/zsh_tmux.sh

# go
"$SOURCE_DIR"/scripts/go.sh

# nodebrew
"$SOURCE_DIR"/scripts/node.sh

# neovim
"$SOURCE_DIR"/scripts/nvim.sh

# peco
"$SOURCE_DIR"/scripts/peco.sh

# direnv
"$SOURCE_DIR"/scripts/direnv.sh

# exa
"$SOURCE_DIR"/scripts/eza.sh

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
"$SOURCE_DIR"/scripts/lazygit.sh
