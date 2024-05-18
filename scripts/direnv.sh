#!/bin/sh
set -xe

if [ "$(direnv version)" ]; then
  echo "direnv is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
	brew install direnv
else
	sudo apt -y install direnv
fi


