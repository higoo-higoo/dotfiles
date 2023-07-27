#!/bin/sh

# Packer.nvimのインストール
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# weztermのインストール
if [ "$(uname)" == 'Darwin'] ; then
	brew tap homebrew/cask-versions
	brew install --cask wezterm-nightly
elif ["$(expr substr $(uname -s) 1 5)" == 'Linux']; then
	curl -LO https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu22.04.deb
	sudo dpkg -i wezterm-nightly.Ubuntu22.04.deb
	rm wezterm-nightly.Ubuntu22.04.deb
fi

# fontのinstall
if [ "$(uname)" == 'Darwin'] ; then
	curl -LO https://github.com/powerline/fonts/raw/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
	sudo cp Meslo%20LG%20M%20Regular%20for%20Powerline.ttf /Library/Fonts
	sudo atsutil databases -remove
	sudo atsutil server -shutdown
	sudo atsutil server -ping
elif ["$(expr substr $(uname -s) 1 5)" == 'Linux']; then
	sudo apt install fontconfig
	cd ~
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
	mkdir -p .local/share/fonts
	unzip Meslo.zip -d .local/share/fonts
	cd .local/share/fonts
	rm *Windows*
	cd ~
	rm Meslo.zip
	fc-cache -fv
fi

# fishのinstall
./scripts/fish.sh
