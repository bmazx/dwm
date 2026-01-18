#!/bin/sh

# dwm
rm -f config.h
sudo make clean install

# dwmblocks
mkdir -p ~/.local/share/dwmblocks
cp extra/scripts/* ~/.local/share/dwmblocks
chmod 755 ~/.local/share/dwmblocks/*
cd extra/dwmblocks
rm -f blocks.h
make
sudo make install
cd ../..
