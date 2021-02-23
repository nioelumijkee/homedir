source /etc/profile

# env
export PD_PATH=$HOME/bin/local/pd
export PYTHONPATH=$HOME/python
export GIT_EDITOR=vi
export PD_RECORDS=$HOME/data/audio/audio_pd

#
PROMPT_DIRTRIM=2
export HISTSIZE=10240

# alias
alias cd..='cd ..'
alias cd-='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias df='df -h'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free='free -mth'
alias hi='history'
alias hacker='clear && cat /dev/urandom | hexdump -C | pv -qL 40'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -la'
alias psaux='ps auxf'
alias su='su -'
