#!/bin/zsh

# peco
if [[ "$(uname)" == "Darwin" ]]
	brew install peco
else if [[! type peco > /dev/null 2>&1; ]] then
    wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
    tar -xvf /tmp/peco.tar.gz -C /tmp/
    mv /tmp/peco_linux_amd64/peco ~/.local/bin/
fi


# zgen
if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

# fzf
if [[! -e "$HOME/.fzf"]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-completion --no-key-bindings --no-update-rc
fi
