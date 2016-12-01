call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'cespare/vim-toml'
Plug 'kana/vim-operator-user'
Plug 'neomake/neomake'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax enable
set background=dark
colorscheme solarized

let mapleader = "\<Space>"

set number
set relativenumber

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_cpp_enabled_makers = ["clangtidy", "clangcheck"]
let g:neomake_cpp_clangcheck_args = ["-p", "build"]
let g:neomake_cpp_clangtidy_args = ["-p", "build"]

" rust.vim
let g:rustfmt_autosave = 1

" vim-airline
let g:airline_theme = 'solarized'

" vim-clang-format
let g:clang_format#auto_format = 1
