#!/bin/sh
set -xe


if [ "$(lazygit --version)" ]; then
  echo "lazygit is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
	brew install lazygit
	brew install git-delta
elif [ "$(uname -m)" = "x86_64" ]; then
  LAZYGIT_VERSION="$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -m 1 'tag_name' | cut -d '"' -f4)"
  LAZYGIT_VERSION="${LAZYGIT_VERSION#v}"
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
else
  LAZYGIT_VERSION="$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -m 1 'tag_name' | cut -d '"' -f4)"
  LAZYGIT_VERSION="${LAZYGIT_VERSION#v}"
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
fi
