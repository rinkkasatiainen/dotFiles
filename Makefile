# Makefile for dotfiles in the style of
# http://github.com/mitsuhiko/dotfiles/blob/master/Makefile
# found in https://github.com/sanitz/dotfiles/blob/master/Makefile

add-spacer:
	`defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'` 
	`killall Dock`


update: update-brew

update-brew:
	@echo '**************update homebrew**************'
	brew update
#	@$(shell brew update)

install: update install-vim  install-git  install-fish configure-bash install-byobu install-omf

install-vim: brew-vim configure-vim

install-js: install-nvm configure-es6

configure-vim:
	rm -rf ~/.vim ~/.vimrc 
	ln -s `pwd`/vim/.vim ~/.vim
	ln -s `pwd`/vim/.vimrc ~/.vimrc
	[ !  -d "~/.vim/pack/themes/opt/solarized8" ] && echo "VIM solarized already installed" || echo "install vim"
	# [ -d "~/.vim/pack/themes/opt/solarized8" ] && echo "VIM solarized already installed" || git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8;\

install-git: brew-git configure-git

configure-git:
	rm -rf ~/.gitconfig ~/.gitignore ~/.gitattributes
	rm -rf ~/.gitconfig_work ~/.gitconfig_personal
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitconfig_work ~/.gitconfig_work;\
	ln -s `pwd`/git/gitconfig_personal ~/.gitconfig_personal
	ln -s `pwd`/git/gitignore_global ~/.gitignore
	ln -s `pwd`/git/gitattributes ~/.gitattributes

install-fish: brew-fish configure-fish

install-jenv: brew-jenv

configure-fish:
	mkdir -p ~/.config
	rm -rf ~/.config/fish
	# [[ -s "~/.config/fish" ]] && rm -rf ~/.config/fish
	ln -s `pwd`/fish ~/.config/fish

install-omf:
	$(call curl -L https://get.oh-my.fish | fish)


configure-bash:
	rm -rf ~/.bashrc
	rm -rf ~/.bash_profile
	ln -s `pwd`/bash_profile/.bashrc ~/.bashrc
	ln -s `pwd`/bash_profile/.bash_profile ~/.bash_profile

install-byobu: brew-byobu configure-byobu

configure-byobu:
	rm -rf ~/.byobu
	ln -s `pwd`/byobu/.byobu ~/.byobu

configure-es6:
	rm -rf ~/.eslintrc
	ln -s `pwd`/es6/.eslintrc ~/.eslintrc
install-misc-rcs:
	rm -rf ~/.wgetrc
	ln -s `pwd`/wgetrc ~/.wgetrc

install-nvm: 
	if [[ -s "~/.nvm" ]] ; then \
		echo '~/.nvm directory exists';\
	else \
	  mkdir ~/.nvm; \
	fi
	$(call curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash)

define brew_install
  @echo 'install $(1)'
	if [ -e "/opt/homebrew/Cellar/$(1)" ] ; \
	then \
		echo 'installed already';\
	else \
		echo '**************';\
		echo 'installing $(1)';\
		echo '**************';\
	fi
endef

brew-git:
	$(call brew_install,git)

brew-byobu:
	$(call brew_install,byobu)

brew-jenv:
	$(call brew_install,jenv)

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

