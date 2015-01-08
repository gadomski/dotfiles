GIT_CLONE = git clone
VIM_BUNDLE_DIR = vim/bundle
ZSH_THEME_DIR = $(HOME)/.oh-my-zsh/custom/themes


default:
.PHONY: default

all: zsh vim tmux git


# zsh
zsh: oh-my-zsh zsh-conf zsh-theme
.PHONY: zsh

oh-my-zsh: $(HOME)/.oh-my-zsh
.PHONY: oh-my-zsh

zsh-conf: $(HOME)/.zshrc
.PHONY: zsh-conf

zsh-theme: $(ZSH_THEME_DIR)/gadomski.zsh-theme
.PHONY: zsh-theme

$(HOME)/.oh-my-zsh:
	curl -L http://install.ohmyz.sh | sh

$(HOME)/.zshrc:
	ln -s $(CURDIR)/zshrc $@

$(ZSH_THEME_DIR)/gadomski.zsh-theme: | $(ZSH_THEME_DIR)
	ln -s $(CURDIR)/gadomski.zsh-theme $@	

$(ZSH_THEME_DIR):
	mkdir $@


# tmux
tmux: tmux-conf
.PHONY: tmux

tmux-conf: $(HOME)/.tmux.conf
.PHONY: tmux-conf

$(HOME)/.tmux.conf:
	ln -s $(CURDIR)/tmux.conf $@


# git
git: $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.git_template
.PHONY: git

$(HOME)/.gitconfig:
	ln -s $(CURDIR)/gitconfig $@

$(HOME)/.gitignore_global:
	ln -s $(CURDIR)/gitignore_global $@

$(HOME)/.git_template:
	ln -s $(CURDIR)/git_template $@


# vim
vim: vimrc vim-dir vim-bundles
.PHONY: vim

vimrc: $(HOME)/.vimrc
.PHONY: vimrc

vim-dir: $(HOME)/.vim
.PHONY: vim-dir

$(HOME)/.vimrc:
	ln -s $(CURDIR)/vimrc $@

$(HOME)/.vim:
	ln -s $(CURDIR)/vim $@

vim-bundles: $(VIM_BUNDLE_DIR)/vim-fugitive \
			 $(VIM_BUNDLE_DIR)/LaTeX-Box \
			 $(VIM_BUNDLE_DIR)/nerdtree \
			 $(VIM_BUNDLE_DIR)/vim-dispatch \
			 $(VIM_BUNDLE_DIR)/vim-markdown \
			 $(VIM_BUNDLE_DIR)/vim-repeat \
			 $(VIM_BUNDLE_DIR)/vim-sensible \
			 $(VIM_BUNDLE_DIR)/vim-surround \
			 $(VIM_BUNDLE_DIR)/vim-unimparied \
			 $(VIM_BUNDLE_DIR)/nerdtree-execute \
			 $(VIM_BUNDLE_DIR)/vim-airline \
			 $(VIM_BUNDLE_DIR)/vim-ledger \
			 $(VIM_BUNDLE_DIR)/bbye \
			 $(VIM_BUNDLE_DIR)/ctrlp.vim \
			 $(VIM_BUNDLE_DIR)/syntastic \
			 $(VIM_BUNDLE_DIR)/tagbar \
			 $(VIM_BUNDLE_DIR)/vim-projectionist \
			 $(VIM_BUNDLE_DIR)/vim-colors-solarized
.PHONY: vim-bundles

$(VIM_BUNDLE_DIR)/vim-fugitive: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-fugitive.git $@

$(VIM_BUNDLE_DIR)/LaTeX-Box: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/LaTeX-Box-Team/LaTeX-Box.git $@

$(VIM_BUNDLE_DIR)/nerdtree: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/scrooloose/nerdtree.git $@

$(VIM_BUNDLE_DIR)/vim-dispatch: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-dispatch.git $@

$(VIM_BUNDLE_DIR)/vim-markdown: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-markdown.git $@

$(VIM_BUNDLE_DIR)/vim-repeat: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-repeat.git $@

$(VIM_BUNDLE_DIR)/vim-sensible: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-sensible.git $@

$(VIM_BUNDLE_DIR)/vim-surround: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-surround.git $@

$(VIM_BUNDLE_DIR)/vim-unimparied: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-unimpaired.git $@

$(VIM_BUNDLE_DIR)/nerdtree-execute: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/ivalkeen/nerdtree-execute.git $@

$(VIM_BUNDLE_DIR)/vim-airline: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/bling/vim-airline.git $@

$(VIM_BUNDLE_DIR)/vim-ledger: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/ledger/vim-ledger.git $@

$(VIM_BUNDLE_DIR)/bbye: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/moll/vim-bbye.git $@

$(VIM_BUNDLE_DIR)/ctrlp.vim: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/kien/ctrlp.vim.git $@

$(VIM_BUNDLE_DIR)/syntastic: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/scrooloose/syntastic.git $@

$(VIM_BUNDLE_DIR)/tagbar: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/majutsushi/tagbar.git $@

$(VIM_BUNDLE_DIR)/vim-projectionist: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/tpope/vim-projectionist.git $@

$(VIM_BUNDLE_DIR)/vim-colors-solarized:
	$(GIT_CLONE) https://github.com/altercation/vim-colors-solarized.git $@

$(VIM_BUNDLE_DIR):
	mkdir $@
