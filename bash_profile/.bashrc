#!/bin/bash
PS1='\h:\W \u\$ '

alias byobu="TERM=screen-256color-bce byobu"
BYOBU_PYTHON=/usr/bin/python

export GOPATH="${HOME}/.go"


  #setenv TERM "xterm-color"
#setenv CLICOLOR "true"
export LSCOLORS=exfxcxdxbxexexabagacad

# !!! Remore pythonpath, using pyenv inisted
##export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

##alias tmux="TERM=screen-256color tmux" #this makes colors work with tmux
#### alias tmux="TERM=screen-256color-bce tmux"

##alias byobu="TERM=screen-256color-bce byobu"
##alias byobu="TERM=xterm-color byobu"


### GIT
alias gitcd="clear; git diff"


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
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## tips from http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
## Colorize the ls output ##
#alias ls='ls -G'
## Use a long listing format ##
#alias ll='ls -la'
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
[ -r /Users/akis/.byobu/prompt ] && . /Users/akis/.byobu/prompt   #byobu-prompt#

PATH="/usr/local/sbin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/`whoami`/.local_bashrc" ]] && source "/Users/`whoami`/.local_bashrc"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[[ -s "$HOME/.nvm" ]] && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[[ -s "$HOME/.local" ]] && [ -s "$HOME/.local/bin" ] && export PATH="~/.local/bin:$PATH"
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/akisalmi/.docker/init-bash.sh || true # Added by Docker Desktop
