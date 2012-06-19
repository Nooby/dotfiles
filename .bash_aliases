# Defining all my aliases in 1 convinient place.
# Gets read by ~/.bashrc

down4me() { wget -qO - "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'; }
rmpyc() { find . -type f -name "*.pyc" -delete; }
g() { grep -rn $1 $2; }
runserver() { ./manage.py runserver; }
django_shell() { ./manage.py shell; }
search_and_destroy() { find . -name $1 -print0 | xargs -0 sed -i "s/$2/$3/g"; }
flush_memcached() {(echo "flush_all" && sleep 1 && echo "quit") | telnet localhost 11211; }
save_notes() { mv ~/notes ~/notebook/$1 && touch ~/notes; }
inetp() { ping 8.8.8.8; }
pdf_compile() { rubber -fd $1 && xdg-open *.pdf; rubber --clean $1; }

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


