# Installation Steps

## Install required Software

```
sudo apt install awesome awesome-extra
sudo apt install rxvt-unicode ranger feh
sudo apt install suckless-tools
sudo apt install wicd wpasuplicant
sudo apt install i3lock scrot
```

## Disable X at Boot

Edit /etc/default/grub with your favourite editor, e.g. nano:
```
sudo nano /etc/default/grub
```
Find this line:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
Change it to:
```
GRUB_CMDLINE_LINUX_DEFAULT="text"
```
Update GRUB:
```
sudo update-grub
```

###For systems that use systemd

This is an additional step for systemd releases, e.g. Ubuntu 15.04, the steps above for grub are still necessary.

You need to tell systemd to not load the graphical login manager:
```
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```
You will still be able to use X by typing startx after you logged in.
