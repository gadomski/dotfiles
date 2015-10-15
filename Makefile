# Top level makefile for configuring systems the way I like 'em.

COMPONENTS=zsh oh-my-zsh-custom tmux git vim vim-bundles cmake ninja

VIM_BUNDLE_URLS= \
    https://github.com/airblade/vim-gitgutter.git \
	https://github.com/altercation/vim-colors-solarized.git \
	https://github.com/bling/vim-airline.git \
	https://github.com/ledger/vim-ledger.git \
	https://github.com/petRUShka/vim-opencl.git \
	https://github.com/rhysd/vim-clang-format.git \
	https://github.com/scrooloose/syntastic.git \
	https://github.com/szw/vim-tags.git \
	https://github.com/tpope/vim-dispatch.git \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/tpope/vim-projectionist.git \
	https://github.com/tpope/vim-unimpaired.git \
	https://github.com/vim-pandoc/vim-pandoc-syntax.git
vim_bundle=$(addprefix vim/bundle/,$(basename $(notdir $(1))))
VIM_BUNDLES=$(call vim_bundle,$(VIM_BUNDLE_URLS))

default:

all: $(COMPONENTS)
.PHONY: $(COMPONENTS)

# We do some mad zsh action, mostly because oh-my-zsh is the bomb.
zsh: ~/.zshrc
	sudo apt-get install zsh
	chsh -s /usr/bin/zsh
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm -rf ~/.oh-my-zsh/custom

oh-my-zsh-configure: ~/.oh-my-zsh/custom

~/.zshrc:
	ln -s $(CURDIR)/zshrc ~/.zshrc

~/.oh-my-zsh/custom:
	ln -s $(CURDIR)/oh-my-zsh-custom ~/.oh-my-zsh/custom

tmux:
	sudo apt-get install tmux
	rm -f ~/.tmux.conf
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf

vim: ~/.vim ~/.vimrc
	sudo apt-get install vim

vim-bundles: $(VIM_BUNDLES) | vim/bundle

~/.vimrc:
	ln -s $(CURDIR)/vimrc ~/.vimrc

~/.vim:
	ln -s $(CURDIR)/vim ~/.vim

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
