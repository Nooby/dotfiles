# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes the Android SDK Tools if it is installed in /opt/
if [ -d "/opt/android-sdk/tools" ] ; then
    export PATH="$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools"
fi

# set PATH so it includes the Go Tools if it is installed
if [ -d "/usr/local/go" ] ; then
    export PATH="$PATH:/usr/local/go/bin"
    export GOROOT="/usr/local/go"
    if [ -d "$HOME/godev" ] ; then
        export GOPATH="$HOME/extgo:$HOME/godev"
        export PATH="$PATH:$HOME/extgo/bin:$HOME/godev/bin"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set TERM to a 256 color terminal
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# set language to English
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

down4me() { wget -qO - "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g' ; }
rmpyc() { find . -type f -name "*.pyc" -delete; }
g() { grep -rn $1 $2; }
runserver() { ./manage.py runserver; }
search_and_destroy() { find . -name $1 -print0 | xargs -0 sed -i "s/$2/$3/g"; }
flush_memcached() {(echo "flush_all"; sleep 1; echo "quit" ) | telnet localhost 11211; }
save_notes() { mv ~/notes ~/notebook/$1; touch ~/notes; }

