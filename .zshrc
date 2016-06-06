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

#Virtualenv Wrapper Settings
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ] ; then

  export WORKON_HOME=~/.envs
  if [ ! -d $WORKON_HOME ] ; then
    mkdir -p $WORKON_HOME
  fi

  export PROJECT_HOME=~/dev
  if [ ! -d $PROJECT_HOME ] ; then
    mkdir -p $PROJECT_HOME
  fi

  source /usr/local/bin/virtualenvwrapper.sh
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH for AppEngine
if [ -d "$HOME/bin/go_appengine" ] ; then
    PATH="$PATH:$HOME/bin/go_appengine"
fi

# set PATH for Android Studio
if [ -d "/opt/android/eclipse" ] ; then
    PATH="/opt/android/eclipse:$PATH"
fi

if [ -d "/opt/android/sdk/platform-tools" ] ; then
    PATH="/opt/android/sdk/platform-tools:$PATH"
fi

if [ -d "/opt/android/ndk" ] ; then
  export NDKROOT="/opt/android/ndk"
fi

alias g='grep -rn'
# alias v='vim --remote-silent'
# alias v='gvim --remote-silent'
alias f='find . -type f | grep'
alias fd='find . -type d | grep'
alias django='python manage.py'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'

v() { emacsclient -c $@ &; }
e() { emacsclient -t $@; }

GOPATH=$HOME/go
GO_VENDOR=$GOPATH/.vendor
PROJECTS=$HOME/Projects
if [ ! -d $GOPATH ] ; then
  mkdir -p $GOPATH
  mkdir -p $GO_VENDOR
fi
if [ -d "$GOPATH/bin" ] ; then
  PATH="$GO_VENDOR/bin:$GOPATH/bin:$PATH"
fi
if [ -d "$PROJECTS/bin" ] ; then
  PATH="$PROJECTS/bin:$PATH"
fi
export GOPATH=$GO_VENDOR:$GOPATH:$PROJECTS
export PATH=$PATH:/usr/local/go/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
