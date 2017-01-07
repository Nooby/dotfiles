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

alias v='emacsclient -c $@'
alias e='emacsclient -t'

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
