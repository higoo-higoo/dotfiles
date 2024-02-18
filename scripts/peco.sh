#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
	brew install peco
	brew install shellcheck
else
	wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
	tar -xvf /tmp/peco.tar.gz -C /tmp/
	mkdir -p ~/.local/bin
	mv /tmp/peco_linux_amd64/peco ~/.local/bin/
fi
