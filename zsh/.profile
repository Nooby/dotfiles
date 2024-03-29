export LANG="en_US.UTF-8"
export EDITOR=vim
export VISUAL="mvim --nofork"
#export VISUAL="nvim-qt"

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
#alias v='nvim-qt'
alias f='find . -type f | grep'
alias fd='find . -type d | grep'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'
alias xup="xrdb ~/.xresources"
alias dc='docker compose'
alias dm='docker-machine'
alias webserver='python -m SimpleHTTPServer'
alias dsdie='find . -name ".DS_Store" -delete'
alias dclean='docker rm $(docker ps -a -f status=exited -q)'
alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge' 

#v() { nvim-qt $@ & disown; }
#e() { emacsclient -t -a "" $@; }

dconnect() { docker exec -it $@ /bin/bash; }

# if [ ! -d $HOME/go/ ] ; then

# export GOROOT="$(brew --prefix go)"
# export GOTOOLDIR="$(brew --prefix golang)/libexec/pkg/tool/darwin_amd64"
# export PATH="$HOME/go/bin:$PATH:${GOROOT}/bin"
# else
#     export GOROOT=$HOME/go
#     export PATH=$HOME/go/bin:$PATH
# fi
#
# export GOPATH=$HOME/Projects/.go
# export GOPATH=$HOME/go
# export GO111MODULE=on
# if [ ! -d $GOPATH ] ; then
#   mkdir -p $GOPATH
# fi
# if [ -d "$GOPATH/bin" ] ; then
#   PATH=$GOPATH/bin:$PATH
# fi
# if [ -d "$HOME/Projects/bin" ] ; then
#   PATH=$HOME/Projects/bin:$PATH
# fi
#
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

# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f ~/.wisent.git-credentials ]; then
    export WISENT_DOCKER_GIT_CREDENTIALS="$(cat ~/.wisent.git-credentials)"
fi

if [ -f ~/.gitlab_token ]; then
    export GITLAB_ACCESS_TOKEN="$(cat ~/.gitlab_token)"
fi

export KUBECONFIG=~/.config/kube/dev.yaml

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add Brew Ruby to PATH 
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
