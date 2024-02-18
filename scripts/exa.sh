#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
	brew install exa
else
	sudo apt -y install exa
fi
