# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export HISTTIMEFORMAT="%d/%m/%y %T "

export PS1='\[\033]0;$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[0m\]\n$ '

alias l='ls -CF'
alias la='ls -la'
alias ll='ls -alF'
source /etc/profile.d/bash_completion.sh

alias upg='apk update && apk upgrade'
alias myip='curl -S https://api.myip.com'
