#!/bin/sh
if [ "$(uname)" == 'Darwin'] ; then
	brew install fish
	sudo echo "/opt/homebrew/bin/fish" >> /etc/shells
	sudo chsh -s /opt/homebrew/bin/fish
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux']; then
	sudo apt install fish
	chsh -s /usr/bin/fish
fi

fish -c "curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && fisher update"

