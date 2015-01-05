VIM_BUNDLE_DIR = vim/bundle
GIT_CLONE = git clone


default:
.PHONY: default	


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
			 $(VIM_BUNDLE_DIR)/a.vim
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

$(VIM_BUNDLE_DIR)/a.vim: | $(VIM_BUNDLE_DIR)
	$(GIT_CLONE) https://github.com/vim-scripts/a.vim.git $@

$(VIM_BUNDLE_DIR):
	mkdir $(VIM_BUNDLE_DIR)
