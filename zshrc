export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dieter"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git osx tmux vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:$HOME/local/bin:$PATH"
export DISABLE_AUTO_TITLE=true
bindkey -v
bindkey "^R" history-incremental-search-backward

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
