#!/bin/bash
[[ -s ~/.bashrc ]] && source ~/.bashrc


export PATH=/usr/local/mysql/bin:$PATH
export AWKPATH=$HOME/.awk

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/akis/.gvm/bin/gvm-init.sh" ]] && source "/Users/akis/.gvm/bin/gvm-init.sh"
export PATH=/usr/local/bin:$PATH
