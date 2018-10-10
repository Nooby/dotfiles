export EDITOR='emacsclient -t -a ""'
export VISUAL='emacsclient -c -a ""'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

PATH="$PATH:/usr/sbin:/sbin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export ANDROID_HOME=/opt/android-sdk
# set PATH for Flutter
if [ -d "/opt/flutter/bin" ] ; then
    PATH="/opt/flutter/bin:$PATH"
fi

alias g='grep -rn'
# alias v='vim --remote-silent'
# alias v='gvim --remote-silent'
alias f='find . -type f | grep'
alias fd='find . -type d | grep'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'
alias xup="xrdb ~/.Xresources"
alias dc='docker-compose'
alias webserver='python -m SimpleHTTPServer'

v() { emacsclient -c -a "" $@ & disown; }
e() { emacsclient -t -a "" $@; }

dconnect() { docker exec -it $@ /bin/bash; }

if [ ! -d $HOME/go/ ] ; then
    export GOROOT=/usr/local/go
    export PATH=/usr/local/go/bin:$PATH
else
    export GOROOT=$HOME/go
    export PATH=$HOME/go/bin:$PATH
fi

export GOPATH=$HOME/Projects
if [ ! -d $GOPATH ] ; then
  mkdir -p $GOPATH
fi
if [ -d "$GOPATH/bin" ] ; then
  PATH=$GOPATH/bin:$PATH
fi

export PYENV_ROOT=$HOME/.pyenv

if [ -d $PYENV_ROOT ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -d $HOME/.local/bin ] ; then
    PATH=$HOME/.local/bin:$PATH
fi
