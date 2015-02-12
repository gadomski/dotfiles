repos=/Users/gadomski/Repos
figtree=~repos/figtree
dotfiles=~repos/dotfiles
finances=/Users/gadomski/Documents/Finances
glacio=~repos/glac.io
rivlib=~repos/rivlib-utils

alias vifinance="cd ~finances && mvim 2015.ledger"
alias vialias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias viexercise="mvim ~/Documents/Exercise/2015.ledger"
alias glum="git pull --ff-only upstream master"

cmakeinit () {
    mkdir build && cd build && ccmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/Users/gadomski/local
}
