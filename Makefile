zsh_custom_files:=$(wildcard custom/*.zsh)

default: ~/.zshrc $(addprefix $(HOME)/.oh-my-zsh/,$(zsh_custom_files)) ~/.config/nvim ~/.gitconfig ~/.git_template ~/.gitignore_global
.PHONY: default

# zsh
~/.zshrc: zshrc
	ln -s $(realpath $<) $@

~/.oh-my-zsh/custom/%.zsh: custom/%.zsh
	ln -s $(realpath $<) $@

# neovim
~/.config/nvim: nvim
	mkdir -p ~/.config
	ln -s $(realpath $<) $@

# git
~/.gitconfig: gitconfig
	ln -s $(realpath $<) $@

~/.git_template: git_template
	ln -s $(realpath $<) $@

~/.gitignore_global: gitignore_global
	ln -s $(realpath $<) $@
