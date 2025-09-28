#!/bin/sh
set -xe

# Dock setting
if [ "$(uname)" = "Darwin" ]; then
  defaults write com.apple.dock persistent-apps -array
  defaults write com.apple.dock appswitcher-all-displays -bool true
  defaults write com.apple.dock autohide -bool true
  killall Dock
  brew install --cask font-plemol-jp-nf
else
  mkdir -p /tmp/plemol && cd /tmp/plemol
  curl -L -o Plemol.zip https://github.com/yuru7/PlemolJP/releases/download/v3.0.0/PlemolJP_NF_v3.0.0.zip
  unzip Plemol.zip
  mkdir -p ~/.local/share/fonts
  find . -name '*.ttf' -exec cp -v {} /home/runner/.local/share/fonts/ \;
  fc-cache -fv
  cd - && rm -rf /tmp/plemol
fi

