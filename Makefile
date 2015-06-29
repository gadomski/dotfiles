# Config
GIT_CLONE = git clone
VIM_BUNDLE_DIR = vim/bundle
OH_MY_ZSH_CUSTOM = $(HOME)/.oh-my-zsh/custom
ZSH_THEME_DIR = $(OH_MY_ZSH_CUSTOM)/themes
ZSH_ALIASES = $(OH_MY_ZSH_CUSTOM)/aliases.zsh
VIM_BUNDLE_URLS = \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/LaTeX-Box-Team/LaTeX-Box.git \
	https://github.com/scrooloose/nerdtree.git \
	https://github.com/tpope/vim-dispatch.git \
	https://github.com/tpope/vim-markdown.git \
	https://github.com/tpope/vim-repeat.git \
	https://github.com/tpope/vim-sensible.git \
	https://github.com/tpope/vim-surround.git \
	https://github.com/tpope/vim-unimpaired.git \
	https://github.com/ivalkeen/nerdtree-execute.git \
	https://github.com/bling/vim-airline.git \
	https://github.com/ledger/vim-ledger.git \
	https://github.com/moll/vim-bbye.git \
	https://github.com/kien/ctrlp.vim.git \
	https://github.com/scrooloose/syntastic.git \
	https://github.com/majutsushi/tagbar.git \
	https://github.com/tpope/vim-projectionist.git \
	https://github.com/altercation/vim-colors-solarized.git \
	https://github.com/mklabs/grunt.vim.git \
	https://github.com/int3/vim-extradite.git \
	https://github.com/idanarye/vim-merginal.git \
	https://github.com/octol/vim-cpp-enhanced-highlight.git \
	https://github.com/kana/vim-operator-user.git \
	https://github.com/rhysd/vim-clang-format.git \
	https://github.com/vim-pandoc/vim-pandoc.git \
	https://github.com/vim-pandoc/vim-pandoc-syntax.git \
	https://github.com/klen/python-mode \
	https://github.com/lambdalisue/nose.vim.git \
	https://github.com/rust-lang/rust.vim.git \
	https://github.com/cespare/vim-toml.git
vim_bundle = $(addprefix $(VIM_BUNDLE_DIR)/,$(basename $(notdir $(1))))
VIM_BUNDLES = $(call vim_bundle,$(VIM_BUNDLE_URLS))


# Phonies
default:
zsh: oh-my-zsh zsh-conf zsh-theme zsh-aliases
oh-my-zsh: $(HOME)/.oh-my-zsh
zsh-conf: $(HOME)/.zshrc
zsh-theme: $(ZSH_THEME_DIR)
zsh-aliases: $(ZSH_ALIASES)
tmux: tmux-conf
tmux-conf: $(HOME)/.tmux.conf
git: $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.git_template
vim: vimrc vim-dir vim-bundles
vimrc: $(HOME)/.vimrc
vim-dir: $(HOME)/.vim
vim-bundles: $(VIM_BUNDLES)
all: zsh vim tmux git

.PHONY: default \
	zsh oh-my-zsh zsh-conf zsh-theme zsh-aliases \
	tmux tmux-conf \
	git \
	vim vimrc vim-dir vim-bundles


# zsh
$(HOME)/.oh-my-zsh:
	curl -L http://install.ohmyz.sh | sh
	rm ~/.zshrc

$(HOME)/.zshrc:
	ln -s $(CURDIR)/zshrc $@

$(ZSH_THEME_DIR):
	ln -s $(CURDIR)/zsh-theme $@

$(ZSH_ALIASES):
	ln -s $(CURDIR)/zsh-aliases.zsh $@


# tmux
$(HOME)/.tmux.conf:
	ln -s $(CURDIR)/tmux.conf $@


# git
$(HOME)/.gitconfig:
	ln -s $(CURDIR)/gitconfig $@

$(HOME)/.gitignore_global:
	ln -s $(CURDIR)/gitignore_global $@

$(HOME)/.git_template:
	ln -s $(CURDIR)/git_template $@


# vim
$(HOME)/.vimrc:
	ln -s $(CURDIR)/vimrc $@

$(HOME)/.vim:
	ln -s $(CURDIR)/vim $@


define VIM_BUNDLE_template
$(call vim_bundle,$(1)): | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) $(1) $$@
endef

$(foreach url,$(VIM_BUNDLE_URLS),$(eval $(call VIM_BUNDLE_template,$(url))))


$(VIM_BUNDLE_DIR):
	mkdir $@
