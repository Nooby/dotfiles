#!/bin/sh
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

wallpaper 

session=${1:-awesome}

case $session in
    kde) exec startkde;;
    i3) exec i3;;
    awesome)
        xcompmgr &
	wmname LG3D
	exec awesome
	;;
    *) exec $1;;
esac
