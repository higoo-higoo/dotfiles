#!/bin/sh
set -xe

if [ "$CHEZMOI_SOURCE_DIR" = "" ]; then
	SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
else
	SOURCE_DIR="$CHEZMOI_SOURCE_DIR"
fi
# Dock setting
if [ "$(uname)" = "Darwin" ]; then
  defaults write com.apple.dock persistent-apps -array
  defaults write com.apple.dock appswitcher-all-displays -bool true
  defaults write com.apple.dock autohide -bool true
  killall Dock
  SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
  brew bundle --file="$SOURCE_DIR/../dot_Brewfile"
else
  # azure-cli
  "$SOURCE_DIR"/scripts/linux_settings/azure_cli.sh
  mkdir -p /tmp/plemol && cd /tmp/plemol
  curl -L -o Plemol.zip https://github.com/yuru7/PlemolJP/releases/download/v3.0.0/PlemolJP_NF_v3.0.0.zip
  unzip Plemol.zip
  mkdir -p ~/.local/share/fonts
  find . -name '*.ttf' -exec cp -v {} /home/runner/.local/share/fonts/ \;
  fc-cache -fv
  cd - && rm -rf /tmp/plemol
  wget https://github.com/jingweno/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz
  tar xfz linux-amd64-1.1.0.tar.gz 
  ls linux-amd64-1.1.0
  mkdir -p /usr/local/bin
  cp linux-amd64-1.1.0/ccat /usr/local/bin/
  rm -rf linux-amd64-1.1.0*
fi

