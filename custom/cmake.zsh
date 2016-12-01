alias cmakeinit="(mkdir -p build && cd build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$HOME/local -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..)"
alias ccb="ccmake --build build"
alias nb="ninja -C build"
