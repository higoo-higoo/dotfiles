#!/bin/sh
set -xe

if [ "$CHEZMOI_SOURCE_DIR" = "" ]; then
	SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
else
	SOURCE_DIR="$CHEZMOI_SOURCE_DIR"
fi


# brew
"$SOURCE_DIR"/scripts/brew.sh

# zsh
"$SOURCE_DIR"/scripts/zsh.sh

# tmux
"$SOURCE_DIR"/scripts/tmux.sh

# go
"$SOURCE_DIR"/scripts/go.sh

# nodebrew
"$SOURCE_DIR"/scripts/node.sh

# neovim
"$SOURCE_DIR"/scripts/nvim.sh

# peco
"$SOURCE_DIR"/scripts/peco_ghq.sh

# direnv
"$SOURCE_DIR"/scripts/direnv.sh

# exa
"$SOURCE_DIR"/scripts/eza.sh

# zgen
"$SOURCE_DIR"/scripts/zgen.sh

# fzf
"$SOURCE_DIR"/scripts/fzf.sh

# lazygit
"$SOURCE_DIR"/scripts/lazygit.sh

# setting
"$SOURCE_DIR"/scripts/setting.sh
