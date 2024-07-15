#!/bin/sh
set -xe

curl -sSL https://install.python-poetry.org | python3 -

pip install --upgrade pip

pip install pyserial
