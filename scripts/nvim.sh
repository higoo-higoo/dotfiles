#!/bin/sh
set -xe

if [ "$(nvim --version)" ]; then
  echo "nvim is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  brew install curl
  brew install ripgrep
  brew install imagemagick
  # brew install snaipe/taps/lua@5.1
  curl -Lo "$HOME/neovim.tar.gz" https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz
  xattr -c "$HOME/neovim.tar.gz"
else
  sudo apt-get -y install gettext
  sudo apt install ripgrep
  curl -Lo "$HOME/neovim.tar.gz" https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
fi

mkdir -p "$HOME/neovim"
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/local/lib
sudo mkdir -p /usr/local/share
tar xzvf "$HOME/neovim.tar.gz" -C "$HOME/neovim" --strip-components=1
sudo mv "$HOME/neovim/bin/nvim" "/usr/local/bin/nvim"
sudo rm -r "/usr/local/share/nvim" "/usr/local/lib/nvim" | exit 0
sudo mv "$HOME/neovim/share/nvim" "/usr/local/share/"
sudo mv "$HOME/neovim/lib/nvim" "/usr/local/lib/"
rm -rf "$HOME/neovim.tar.gz" "$HOME/neovim"

# packerがインストールされているか
if [ ! -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# texlabのformatに必要なモジュールをダウンロード
if [ ! "$(cpanm)" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    brew install cpanminus
  else
    sudo apt-get -y install perl
    curl -L https://cpanmin.us | perl - --sudo App::cpanminus
  export PATH="$PATH:/usr/local/bin"
  fi
fi

sudo cpanm YAML::Tiny
