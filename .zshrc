# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kardan"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow command-not-found django pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/nooby/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/android-sdk/tools:/opt/android-sdk/platform-tools

export PROJECT_HOME="$HOME/dev"

down4me() { wget -qO - "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'; }
rmpyc() { find . -type f -name "*.pyc" -delete; }
search_and_destroy() { find . -name $1 -print0 | xargs -0 sed -i "s/$2/$3/g"; }
flush_memcached() {(echo "flush_all" && sleep 1 && echo "quit") | telnet localhost 11211; }
save_notes() { mv ~/notes ~/notebook/$1 && touch ~/notes; }
inetp() { ping 8.8.8.8; }
o() { xdg-open $1; }

alias v='vim --remote-silent'
alias gv='gvim --remote-silent'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


