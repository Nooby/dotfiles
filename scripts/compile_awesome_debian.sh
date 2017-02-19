#!/bin/bash

mkdir build
cd build

sudo apt install libxcb-xkb-dev libxcb-xrm-dev lua-ldoc
sudo apt-get build-dep awesome

sudo apt install gdk-pixbuf-2.0
sudo apt install libgdk-pixbuf2.0-0
sudo apt-get install libgtk2.0-dev
sudo apt install libxcb-cursor-dev
sudo apt install libxkbcommon-dev
sudo apt install libxkbcommon-x11-dev

cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFIG_DIR=/etc

make -j4
make package
