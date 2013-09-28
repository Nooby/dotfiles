# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nooby/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias ls='ls --color=auto'
alias df='df -h'

PROMPT="[%n@%m %1~]$ "

[[ -f ~/.profile ]] && source ~/.profile
