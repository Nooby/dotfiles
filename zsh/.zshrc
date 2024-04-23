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

alias m269-23j='cd "/Users/giuliano/Library/CloudStorage/GoogleDrive-giulianodipasquale.gdp@gmail.com/My Drive/Study/OU/M269 - Algo/M269-23J";source /Users/giuliano/venvs/m269-23j/bin/activate'
alias nb='jupyter notebook &'
alias allowed='python3.10 "/Users/giuliano/Library/CloudStorage/GoogleDrive-giulianodipasquale.gdp@gmail.com/My Drive/Study/OU/M269 - Algo/M269-23J/allowed.py" -c "/Users/giuliano/Library/CloudStorage/GoogleDrive-giulianodipasquale.gdp@gmail.com/My Drive/Study/OU/M269 - Algo/M269-23J/m269.json"'
