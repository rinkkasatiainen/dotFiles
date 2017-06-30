# Makefile for dotfiles in the style of
# http://github.com/mitsuhiko/dotfiles/blob/master/Makefile
# found in https://github.com/sanitz/dotfiles/blob/master/Makefile

update: update-brew

update-brew:
	@echo 'update homebrew'
	@echo $(shell brew update)
#	@$(shell brew update)

install: update install-vim  configure-git  install-fish configure-bash install-byobu

install-vim: brew-vim configure-vim

configure-vim:
	rm -rf ~/.vim ~/.vimrc 
	ln -s `pwd`/vim/.vim ~/.vim
	ln -s `pwd`/vim/.vimrc ~/.vimrc

configure-git:
	rm -rf ~/.gitconfig ~/.gitignore ~/.gitattributes
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore_global ~/.gitignore
	ln -s `pwd`/git/gitattributes ~/.gitattributes

install-fish: brew-fish configure-fish

configure-fish:
	mkdir -p ~/.config
	rm -rf ~/.config/fish
	# [[ -s "~/.config/fish" ]] && rm -rf ~/.config/fish
	ln -s `pwd`/fish ~/.config/fish

configure-bash:
	rm -rf ~/.bashrc
	rm -rf ~/.bash_profile
	ln -s `pwd`/bash_profile/.bashrc ~/.bashrc
	ln -s `pwd`/bash_profile/.bash_profile ~/.bash_profile

install-byobu: brew-byobu configure-byobu

configure-byobu:
	rm -rf ~/.byobu
	ln -s `pwd`/byobu/.byobu ~/.byobu

install-es6:
	rm -rf ~/.eslintrc
	ln -s `pwd`/es6/.eslintrc ~/.eslintrc
install-misc-rcs:
	rm -rf ~/.wgetrc
	ln -s `pwd`/wgetrc ~/.wgetrc

install-nvm: brew-nvm

define _brew_install
	@echo ' $(1)'
	@ [ -e "/usr/local/Cellar/$(1)" ] && return
	@echo 'ypu'
endef
	#	[ ! -e "/usr/local/Cellar/$(1)" ] ||  $(shell brew install $(1))

define brew_install
  @echo 'install $(1)'
	@ if [ -e "/usr/local/Cellar/$(1)" ] ; then \
		echo 'installed already';\
	else \
		echo '**************';\
		echo 'installing $(1)';\
		echo '**************';\
		echo $(shell brew install $(1)); \
	fi
endef

brew-byobu:
	$(call brew_install,byobu)

brew-fish:
	$(call brew_install,fish)

brew-nvm:
	$(call brew_install,nvm)

brew-vim:
	$(call brew_install,vim)

brew-mariadb:
	$(call brew_install,mariadb)

brew-mysql:
	$(call brew_install,mysql)

_brew-nvm:
	@echo 'installing nvm'
	@if [ -e "/usr/local/Cellar/nvm" ] ; then \
		echo 'installed already';\
	else \
		echo '**************';\
		echo 'installing nvm';\
		echo '**************';\
		`brew install nvm`; \
	fi

_brew-vim:
	@if [ -e "/usr/local/bin/vim" ] ; then \
		echo 'installed already';\
	else \
		echo '**************';\
		echo 'installing VIM';\
		echo '**************';\
		`brew install vim`; \
	fi
