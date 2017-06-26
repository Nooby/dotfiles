mate-power-manager &
mate-screensaver &
mate-settings-daemon &
mate-volume-control-applet &
nm-applet &
bash ~/bin/emacs-daemon.sh
slack &

xrdb -merge ~/.xresources

export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

exec awesome
