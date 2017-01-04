source $HOME/.cargo/env
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
alias clippy="rustup run nightly cargo clippy"
alias c="cargo"
