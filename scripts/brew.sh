#!/bin/sh
set -xe

if [ "$(uname)" = "Darwin" ]; then
  SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
  brew bundle --file="$SOURCE_DIR/../dot_Brewfile"
fi

