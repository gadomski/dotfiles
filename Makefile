default: ~/.zshrc ~/.config/nvim ~/.gitconfig ~/.git_template ~/.gitignore_global
.PHONY: default

# zsh
~/.zshrc: zshrc
	ln -s $(realpath $<) $@

# neovim
~/.config/nvim: nvim | ~/.config
	ln -s $(realpath $<) $@

# git
~/.gitconfig: gitconfig
	ln -s $(realpath $<) $@

~/.git_template: git_template
	ln -s $(realpath $<) $@

~/.gitignore_global: gitignore_global
	ln -s $(realpath $<) $@
