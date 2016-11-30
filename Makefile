default: ~/.zshrc ~/.config/nvim ~/.git_template ~/.gitignore_global
.PHONY: default

# zsh
~/.zshrc: zshrc
	ln -s $(realpath $<) $@

# neovim
~/.config/nvim: nvim | ~/.config
	ln -s $(realpath $<) $@

# git
~/.git_template: git_template
	ln -s $(realpath $<) $@

~/.gitignore_global: gitignore_global
	ln -s $(realpath $<) $@
