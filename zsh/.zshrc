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
plugins=(aws brew docker docker-compose dotenv git git-extras pipenv ssh-agent)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
export PATH="/opt/homebrew/opt/go@1.19/bin:$PATH"
