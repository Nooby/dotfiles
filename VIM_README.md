# VIM Dotfiles

VIM Configuration Files organized with [Pathogen](https://github.com/tpope/vim-pathogen). The Plugins are installed as Submodules in the Bundles Directory. After Cloning the submodules have to be initialized recursively since some have submodules of their own.

```
git submodule update --init --recursive
```

Airline, Syntastic, and YouCompleteMe have manual installation steps.

## Ack

```
sudo apt install ack-grep
```

## Airline

Airline needs the Patched Powerline fonts to display correctly. Install the Fonts from the repository below and set one of the Fonts as the Terminal Font and Gvim Font.

```
https://github.com/powerline/fonts
```

## Syntastic

Syntastic uses Syntax Checkers installed on the System and have to be installed seperately. 

Read `:help syntastic-checkers` to choose supported ones.

#### Python

```
sudo apt install python-pip
pip install flake8
```

#### GO

```
go get -u github.com/golang/lint/golint
```

## YouCompleteMe

```
sudo apt install cmake
./install.py --clang-completer --gocode-completer
```
