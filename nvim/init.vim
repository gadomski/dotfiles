call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'kana/vim-operator-user'
Plug 'neomake/neomake'
Plug 'rhysd/vim-clang-format'
call plug#end()

syntax enable
set background=dark
colorscheme solarized

let mapleader = "\<Space>"

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_cpp_enabled_makers = ["clangtidy", "clangcheck"]
let g:neomake_cpp_clangcheck_args = ["-p", "build"]
let g:neomake_cpp_clangtidy_args = ["-p", "build"]

" vim-clang-format
let g:clang_format#auto_format = 1
