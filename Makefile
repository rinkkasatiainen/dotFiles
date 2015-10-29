# Makefile for dotfiles in the style of
# http://github.com/mitsuhiko/dotfiles/blob/master/Makefile
# found in https://github.com/sanitz/dotfiles/blob/master/Makefile

install: install-vim  install-git  install-fish install-bash install-byobu

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim/.vim ~/.vim
	ln -s `pwd`/vim/.vimrc ~/.vimrc

install-mutt:
	rm -rf ~/.mutt ~/.muttrc ~/.msmtprc ~/.goobookrc ~/.offlineimaprc
	ln -s `pwd`/mutt ~/.mutt
	ln -s ~/.mutt/muttrc ~/.muttrc
	ln -s ~/.mutt/msmtprc ~/.msmtprc
	ln -s ~/.mutt/goobookrc ~/.goobookrc
	ln -s ~/.mutt/offlineimaprc ~/.offlineimaprc

install-git:
	rm -rf ~/.gitconfig ~/.gitignore
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore_global ~/.gitignore

install-zsh:
	rm -rf ~/.zshrc ~/.oh-my-zsh ~/.zsh ~/.zprofile
	ln -s `pwd`/zshrc ~/.zshrc
	ln -s `pwd`/oh-my-zsh ~/.oh-my-zsh
	ln -s `pwd`/zsh ~/.zsh
	ln -s `pwd`/zprofile ~/.zprofile

install-custom-zsh: install-zsh
	rm -r `pwd`/oh-my-zsh/custom/* # remove placeholder files
	ln -s `pwd`/zsh/custom/* `pwd`/oh-my-zsh/custom/ # install custom plugins

install-fish:
	rm -rf ~/.config/fish
	# [[ -s "~/.config/fish" ]] && rm -rf ~/.config/fish
	ln -s `pwd`/fish ~/.config/fish

install-bash:
	rm -rf ~/.bashrc
	rm -rf ~/.bash_profile
	ln -s `pwd`/bash_profile/.bashrc ~/.bashrc
	ln -s `pwd`/bash_profile/.bash_profile ~/.bash_profile

install-byobu:
	rm -rf ~/.byobu
	ln -s `pwd`/byobu/.byobu ~/.byobu

install-misc-rcs:
	rm -rf ~/.wgetrc
	ln -s `pwd`/wgetrc ~/.wgetrc