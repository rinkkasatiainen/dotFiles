# dotFiles
my configuration files, including .vimrc and .byobu -files and default .gitignore files

# installation procedure
Install following apps before:

 * dropbox (optional)
 * 1Password (use dropbox, and later account)
 * homebrew [install](https://docs.brew.sh/Installation)
    * brew install git
    * git clone
    * make Makefile
 * all necessary Apps from AppStore
 * Jetbrains accounts -> IDEs
 * RVM, NVM
 * omf install nvm

 ## OMF oh-my-fish


## configuration
 - before cloning the dotfiles, SSH needs to be configured:

```
akisalmi@Aki-MacBook-Pro dotfiles % cat ~/.ssh/config 
Host github
  AddKeysToAgent yes
  UseKeychain yes
  Host github.com
  IdentityFile ~/.ssh/aki_salmi
```

### configurating SSH




## Fish shell
tip from "http://hackercodex.com/guide/install-fish-shell-mac-ubuntu/"
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

## vim
 * https://blog.sourcerer.io/making-vim-great-again-cdfbc281428b

install solarized:

https://vimawesome.com/plugin/solarized-8
## git
some links to consider of git aliases

 * https://gist.github.com/EQuimper/d875df92ef0ddaabf00636c90dbc9d25
 * https://www.atlassian.com/blog/git/advanced-git-aliases 
 * http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/
 * https://bitbucket.org/durdn/cfg/src/master/.gitconfig?at=master&_ga=2.67046695.846822396.1517830682-1854258885.1517830682&fileviewer=file-view-default

## installing PHP:

https://getgrav.org/blog/macos-sierra-apache-multiple-php-versions
