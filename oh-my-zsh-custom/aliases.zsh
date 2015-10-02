r=$HOME/Repos
d=$HOME/Documents

alias nb="ninja -C build"
alias cmakeinit="(mkdir build && cd build && ccmake .. -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=$HOME/local)"
