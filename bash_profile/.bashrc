#!/bin/bash

export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
alias byobu="TERM=screen-256color-bce byobu"
##alias tmux="TERM=screen-256color tmux" #this makes colors work with tmux
#### alias tmux="TERM=screen-256color-bce tmux"

##alias byobu="TERM=screen-256color-bce byobu"
##alias byobu="TERM=xterm-color byobu"


### GIT
alias gitcd="clear; git diff"

## tips from http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
## Colorize the ls output ##
alias ls='ls -G'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
alias l.='ls -d .* --color=auto'


## get rid of command not found ##
alias cd..='cd ..'
## a quick way to get out of current directory ##
alias ..='cd ..'


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# do not delete / or prompt if deleting more than 3 files at a time #
#alias rm='rm -i --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
# alias chown='chown --preserve-root'
# alias chmod='chmod --preserve-root'
# alias chgrp='chgrp --preserve-root'

## export BYOBU_PREFIX=/usr/local/Cellar/byobu/5.75/

if test -f ~/.rvm/scripts/rvm; then
      [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
    fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/akis/.gvm/bin/gvm-init.sh" ]] && source "/Users/akis/.gvm/bin/gvm-init.sh"

[ -r /Users/akis/.byobu/prompt ] && . /Users/akis/.byobu/prompt   #byobu-prompt#
