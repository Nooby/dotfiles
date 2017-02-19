export EDITOR="emacsclient -t -a emacs"
export VISUAL="emacsclient -c -a emacs"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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
alias dc='docker-compose'
alias webserver='python -m SimpleHTTPServer'

alias v='emacsclient -c $@'
alias e='emacsclient -t'

export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects
if [ ! -d $GOPATH ] ; then
  mkdir -p $GOPATH
fi
if [ -d "$GOPATH/bin" ] ; then
  PATH="$GOPATH/bin:$PATH"
fi
