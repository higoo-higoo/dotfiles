#!/bin/sh
set -xe

# Dock setting
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock appswitcher-all-displays -bool true
defaults write com.apple.dock autohide -bool true
killall Dock

# Font setting
mkdir -p /tmp/cica && cd /tmp/cica
curl -L -o Cica.zip https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip
unzip Cica.zip
cp -v ./*.ttf ~/Library/Fonts/
cd -
