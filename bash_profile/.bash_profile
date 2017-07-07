#!/bin/bash
# .bash_profile

# set -o vi



eval "$(jenv init -)"

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin
export AWKPATH=$HOME/.awk
export PATH=/usr/local/bin:$PATH:/usr/local/sbin

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/`whoami`/.local_bash_profile" ]] && source "/Users/`whoami`/.local_bash_profile"
# Get the aliases and functions
[[ -s ~/.bashrc ]] && source ~/.bashrc

source $(brew --prefix nvm)/nvm.sh

export NVM_DIR="$HOME/.nvm"
[[ -s "$HOME/.nvm" ]] && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
