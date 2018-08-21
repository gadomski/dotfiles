export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/bin:$HOME/local/bin:/usr/local/bin:$PATH"

ZSH_THEME="dieter"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git osx tmux vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

export DISABLE_AUTO_TITLE=true
bindkey -v
bindkey "^R" history-incremental-search-backward
