#!/bin/bash

apt install -t jessie-backports -y linux-image-amd64 xserver-xorg-video-intel firmware-iwlwifi

apt install -y awesome awesome-extra build-essential feh filezilla
apt install -y gdebi i3lock meld ranger rxvt-unicode scrot suckless-tools xstow zsh
apt install -y git gitk tig
apt install -y emacs
apt install -y vim-gtk
apt install -y wicd

apt install -y docker.io

apt install -y nautilus nautilus-scripts-manager nautilus-share
apt install -y nautilus-open-terminal nautilus-admin/jessie-backports nautilus-actions

apt install -y pavucontrol mate-indicator-applet

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
