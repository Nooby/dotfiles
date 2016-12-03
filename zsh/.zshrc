# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kardan"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extra git-flow lein vagrant extract debian django)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export ANDROID_HOME=/opt/android-sdk
# set PATH for Flutter
if [ -d "/opt/flutter/bin" ] ; then
    PATH="$PATH:/opt/flutter/bin"
fi

alias g='grep -rn'
# alias v='vim --remote-silent'
# alias v='gvim --remote-silent'
alias f='find . -type f | grep'
alias fd='find . -type d | grep'
alias django='python manage.py'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'
alias xup="xrdb ~/.Xresources"

v() { emacsclient -c $@ &; }
e() { emacsclient -t $@; }

GOPATH=$HOME/Projects
#GO_VENDOR=$GOPATH/.vendor
if [ ! -d $GOPATH ] ; then
  mkdir -p $GOPATH
#  mkdir -p $GO_VENDOR
fi
if [ -d "$GOPATH/bin" ] ; then
  PATH="$GOPATH/bin:$PATH"
#  PATH="$GO_VENDOR/bin:$GOPATH/bin:$PATH"
fi
export GOPATH=$GOPATH
export PATH=$PATH:/usr/local/go/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
