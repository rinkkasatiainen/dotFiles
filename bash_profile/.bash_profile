#!/bin/bash
# .bash_profile

# set -o vi


if [ -f '/usr/local/bin/jenv' ]; \
then \
  echo "setting jenv"; \
#  export PATH="$HOME/.jenv/bin:$PATH"; \
  eval "$(jenv init -)"; \
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin
export AWKPATH=$HOME/.awk
export PATH=/usr/local/bin:$PATH:/usr/local/sbin

echo "setting bash profiles"
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/`whoami`/.local_bash_profile" ]] && source "/Users/`whoami`/.local_bash_profile"
# Get the aliases and functions
[[ -s ~/.bashrc ]] && source ~/.bashrc

#source $(brew --prefix nvm)/nvm.sh

echo "setting nvm"
export NVM_DIR="$HOME/.nvm"
[[ -s "$HOME/.nvm" ]] && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rinkkasatiainen/workspace/google-cloud-sdk/path.bash.inc' ]; then source '/Users/rinkkasatiainen/workspace/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rinkkasatiainen/workspace/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/rinkkasatiainen/workspace/google-cloud-sdk/completion.bash.inc'; fi

if [ -f '/usr/local/bin/pyenv' ]; \
then \
  eval "$(pyenv init -)"; \
  eval "$(pyenv virtualenv-init -)"; \
fi

source /Users/akisalmi/.docker/init-bash.sh || true # Added by Docker Desktop
