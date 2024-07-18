#!/bin/sh
set -xe

curl -sSL https://install.python-poetry.org | python3 -

pip install --upgrade pip

pip install pyserial

pip install pyrealsense2

sudo apt install libcanberra-gtk-module libcanberra-gtk3-module -y
