#!/bin/sh
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xrandr --output DP1 --right-of VGA1

xcompmgr &
nm-applet &                  # assuming you're using Network Manager
eval `gnome-keyring-daemon`  # SSH/GPG agent

session=${1:-awesome}
case $session in
    i3) exec i3;;
    awesome) exec awesome;;
    *) exec $1;;
esac
