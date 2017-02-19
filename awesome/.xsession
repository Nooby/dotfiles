mate-power-manager &
mate-screensaver &
mate-settings-daemon &
nm-applet &
bash ~/bin/emacs-daemon.sh

xrdb -merge ~/.xresources
bash ~/.screenlayout/default.sh

export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

exec awesome
