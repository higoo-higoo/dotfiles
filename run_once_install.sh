#!/bin/bash
set -xe

# neovim
if [[ "$(uname)" == "Darwin" ]]; then
	brew install nodebrew
	nodebrew setup
	echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
	source ~/.zshrc
else
	sudo apt update
	sudo apt -y install nodejs npm
	sudo npm install n -g
	sudo n stable
	sudo apt -y remove nodejs npm
fi
	


# peco
if [[ "$(uname)" == "Darwin" ]]; then
	brew install peco
else
	wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
	tar -xvf /tmp/peco.tar.gz -C /tmp/
	mv /tmp/peco_linux_amd64/peco ~/.local/bin/
fi

# direnv
if [[ "$(uname)" == "Darwin" ]]; then
	brew install direnv
else
	sudo apt -y install direnv
fi

# exa
if [[ "$(uname)" == "Darwin" ]]; then
	brew install exa
else
	sudo apt -y install exa
fi


# zgen
if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

# fzf
if [[ ! -e "$HOME/.fzf" ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-completion --no-key-bindings --no-update-rc
fi

# lasygit
if [[ "$(uname)" == "Darwin" ]]; then
	brew install lazygit
elif [ $(uname -m) == "x86_64" ] ; then
	export LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
else
	export LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
fi
