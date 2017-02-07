#!/bin/sh
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# TODO: Find a consistent method that works on all my systems.
# xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1
xrandr --output eDP1 --auto --output DP2-2 --auto --left-of eDP1 --output DP2-3 --auto --left-of DP2-2
mpd
dbus-launch

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

#unagi &
eval `gnome-keyring-daemon`  # SSH/GPG agent

session=${1:-awesome}
case $session in
    i3) exec i3;;
    awesome) exec awesome;;
    unity) exec unity;;
    herbstluft) exec unity;;
    *) exec $1;;
esac
