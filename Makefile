# Top level makefile for configuring systems the way I like 'em.

default:

all: zsh tmux vim git

# We do some mad zsh action, mostly because oh-my-zsh is the bomb.
zsh:
	sudo apt-get install zsh
	chsh -s /usr/bin/zsh
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm ~/.zshrc
	ln -s $(CURDIR)/zshrc ~/.zshrc 

tmux:
	sudo apt-get install tmux
	rm -f ~/tmux.conf
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf

vim:
	sudo apt-get install vim

git:
	git config --global user.email "pete.gadomski@gmail.com"
	git config --global user.name "Pete Gadomski"
	git config --global core.editor vim
