# Top level makefile for configuring systems the way I like 'em.

COMPONENTS=zsh tmux git vim vim-bundles cmake ninja
VIM_BUNDLE_URLS= \
		 https://github.com/altercation/vim-colors-solarized.git \
		 https://github.com/tpope/vim-dispatch.git \
		 https://github.com/tpope/vim-fugitive.git
vim_bundle=$(addprefix vim/bundle/,$(basename $(notdir $(1))))
VIM_BUNDLES=$(call vim_bundle,$(VIM_BUNDLE_URLS))

default:

all: $(COMPONENTS)
.PHONY: $(COMPONENTS)

# We do some mad zsh action, mostly because oh-my-zsh is the bomb.
zsh:
	sudo apt-get install zsh
	chsh -s /usr/bin/zsh
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm ~/.zshrc
	ln -s $(CURDIR)/zshrc ~/.zshrc 

tmux:
	sudo apt-get install tmux
	rm -f ~/.tmux.conf
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf

vim:
	sudo apt-get install vim
	rm -f ~/.vimrc
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim/autoload ~/.vim/autoload

vim-bundles: $(VIM_BUNDLES)
	test ! -f ~/.vim/bundle && ln -s $(CURDIR)/vim/bundle ~/.vim/bundle

git:
	git config --global user.email "pete.gadomski@gmail.com"
	git config --global user.name "Pete Gadomski"
	git config --global core.editor vim
	git config --global core.excludesfile ~/.gitignore_global
	rm -f ~/.gitignore_global
	ln -s $(CURDIR)/gitignore_global ~/.gitignore_global

cmake:
	sudo apt-get install cmake cmake-curses-gui

ninja:
	sudo apt-get install ninja-build


# Some magic to set up a target for each bundle
define VIM_BUNDLE_template
$(call vim_bundle,$(1)): | vim/bundle
	git clone $(1) $$@
endef

$(foreach url,$(VIM_BUNDLE_URLS),$(eval $(call VIM_BUNDLE_template,$(url))))

vim/bundle:
	mkdir $@
