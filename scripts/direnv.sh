#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
	brew install direnv
else
	sudo apt -y install direnv
fi


