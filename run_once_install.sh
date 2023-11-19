#!/bin/bash

# peco
if [[ "$(uname)" == "Darwin" ]]; then
	brew install peco
fi
if ! type peco > /dev/null 2>&1;  then
    wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
    tar -xvf /tmp/peco.tar.gz -C /tmp/
    mv /tmp/peco_linux_amd64/peco ~/.local/bin/
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
elif [[ ! -e "/usr/local/bin/lazygit" ]]; then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
fi
