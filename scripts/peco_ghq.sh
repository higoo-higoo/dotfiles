#!/bin/sh
set -xe

if [ "$(peco --version)" ]; then
  echo "peco is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
	brew install peco
	brew install shellcheck
  brew install ghq
else
	wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
	tar -xvf /tmp/peco.tar.gz -C /tmp/
	mkdir -p ~/.local/bin
	mv /tmp/peco_linux_amd64/peco ~/.local/bin/peco
	go install github.com/x-motemen/ghq@latest
fi
