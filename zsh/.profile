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

if [ -d $HOME/.local/bin ] ; then
    PATH=$HOME/.local/bin:$PATH
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

# GO Setup
export GOEXPERIMENT=rangefunc # Introduced go1.22
if [ -d $HOME/go/ ] ; then
    export PATH="$HOME/go/bin:$PATH"
    # export GOROOT=$HOME/go
    # export PATH=$HOME/go/bin:$PATH
fi

# Python Setup
export PYENV_ROOT=$HOME/.pyenv

if [ -d $PYENV_ROOT ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi

# Node setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
