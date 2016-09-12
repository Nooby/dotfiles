# Nooby's dotfiles

My current Linux configuration for arch linux and awesome wm. It also includes other Window Managers that I want to try out.

## Installation

Install Git and xstow or stow.

```
sudo apt install git tig gitk
sudo apt install xstow
```

Then clone the Repository to `~/dotfiles` and initialise the Submodules:

```
git clone https://github.com/Nooby/dotfiles.git
git submodule update --init --recursive
```

Activate the Config packages with xstow. Example:

```
xstow awesome
```

Some config Packages have additional Installation Steps.

### Install MPD

```
sudo apt install mpd ncmpcpp
systemctl disable mpd
mkdir ~/.mpd/playlists
touch ~/.mpd/{state,database,log,pid,state}
```
