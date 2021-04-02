# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export HISTTIMEFORMAT="%d/%m/%y %T "

PS1='\[\e]0;$PWD\007\]' # set window title
PS1="$PS1"'\n'          # new line
PS1="$PS1"'\[\e[32m\]'  # change to green
PS1="$PS1"'\u@\h '      # user@host<space>
PS1="$PS1"'\[\e[33m\]'  # change to brownish yellow
PS1="$PS1"'\w'          # current working directory
PS1="$PS1"'\[\e[0m\]'   # change color
source git-completion.bash
source git-prompt.sh
PS1="$PS1"'\[\e[36m\]'  # change color to cyan
PS1="$PS1"'`__git_ps1`' # bash function
PS1="$PS1"'\[\e[0m\]'   # change color
PS1="$PS1"'\n'          # new line
export PS1="$PS1"'$ '   # prompt: always $

alias l='ls -CF'
alias la='ls -la'
alias ll='ls -alF'
source /etc/profile.d/bash_completion.sh

alias upg='apk update && apk upgrade'
alias myip='curl -S https://api.myip.com'
