# VIM Dotfiles

VIM Configuration Files organized with [VIM Plug](https://github.com/junegunn/vim-plug). Airline and Syntastic have manual installation steps.

```
git submodule update --init --recursive
```

## Ack

```
sudo apt install ack-grep
```

## Airline

Airline needs the Patched Powerline fonts to display correctly. Install the Fonts from the repository below and set one of the Fonts as the Terminal Font and GVim Font.

```
https://github.com/powerline/fonts
```

## Syntastic

Syntastic uses Syntax Checkers installed on the System and have to be installed separately.

Read `:help syntastic-checkers` to choose supported ones.

#### Python

```
sudo apt install python-pip
pip install flake8 mypy pylint python-language-server
```

