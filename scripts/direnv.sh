#!/bin/sh
set -xe

if [ "$(direnv version)" ]; then
  echo "direnv is already installed."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  brew install direnv
else
  curl -L https://github.com/direnv/direnv/releases/download/v2.37.0/direnv.linux-amd64 -o /usr/local/bin/direnv
  chmod 755 /usr/local/bin/direnv
fi
