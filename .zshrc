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

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ] ; then
  export WORKON_HOME=~/.envs
  if [ ! -d $WORKON_HOME ] ; then
    mkdir -p $WORKON_HOME
  fi
  source /usr/local/bin/virtualenvwrapper.sh
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
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
alias v='vim --remote-silent'
alias django_runserver='python manage.py runserver'
alias django_shell='python manage.py shell'
alias django='python manage.py'
alias inetp='ping 8.8.8.8'
alias o='xdg-open'
