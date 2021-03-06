export LANG="en_US.UTF-8"
export EDITOR=vim
export VISUAL="gvim --nofork"

#export EDITOR='emacsclient -t -a ""'
#export VISUAL='emacsclient -c -a ""'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.profile_secret" ]; then
    . "$HOME/.profile_secret"
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
#alias v='vim --remote-silent'
alias v='gvim --remote-silent'
alias f='find . -type f | grep'
alias fd='find . -type d | grep'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'
alias xup="xrdb ~/.xresources"
alias dc='docker-compose'
alias webserver='python -m SimpleHTTPServer'
alias dsdie='find . -name ".DS_Store" -delete'

#v() { emacsclient -c -a "" $@ & disown; }
#e() { emacsclient -t -a "" $@; }

dconnect() { docker exec -it $@ /bin/bash; }

if [ ! -d $HOME/go/ ] ; then
		export GOROOT="$(brew --prefix golang)"
    export PATH="$PATH:${GOROOT}/bin"
else
    export GOROOT=$HOME/go
    export PATH=$HOME/go/bin:$PATH
fi

export GOPATH=$HOME/Projects/.go
export GO111MODULE=on
if [ ! -d $GOPATH ] ; then
  mkdir -p $GOPATH
fi
if [ -d "$GOPATH/bin" ] ; then
  PATH=$GOPATH/bin:$PATH
fi
if [ -d "$HOME/Projects/bin" ] ; then
  PATH=$HOME/Projects/bin:$PATH
fi

export PYENV_ROOT=$HOME/.pyenv

if [ -d $PYENV_ROOT ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d $HOME/.local/bin ] ; then
    PATH=$HOME/.local/bin:$PATH
fi

export PATH="$HOME/.poetry/bin:$PATH"

