#!/bin/bash
# .bash_profile

# set -o vi


# Get the aliases and functions
[[ -s ~/.bashrc ]] && source ~/.bashrc

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
export PATH
export AWKPATH=$HOME/.awk

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/`whoami`/.local_bash_profile" ]] && source "/Users/`whoami`/.local_bash_profile"
export PATH=/usr/local/bin:$PATH
