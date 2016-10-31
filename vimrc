" Enable pathogen. Do it. Do it now.
execute pathogen#infect()

" The basics
syntax on
filetype plugin indent on
set laststatus=2
set hlsearch

" Tabs to spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" Set up solarized
set background=dark
colorscheme solarized
highlight Normal ctermbg=none

" Force .md to be markdown instead of modula2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Line numbers, doy
set number
set relativenumber

" Smart case-sensitivity in searching
set smartcase

" Tab mode in the command bar
set wildmenu

" Delete autoindents
set backspace=indent

" Local leader
let mapleader=" "
let maplocalleader=" "

" Load man.vim
runtime! ftplugin/man.vim


"""""""""""""""""
" Plugin zone
"""""""""""""""""

" airline
let g:airline#extensions#tabline#enabled = 1

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk

" vim-tags
let g:vim_tags_ctags_binary="noglob ctags"
let g:vim_tags_auto_generate=0

" rust.vim
let g:rustfmt_autosave=1

" rust-doc
let g:rust_doc#downloaded_rust_doc_dir = "/usr/local"

" clang-format
let g:clang_format#auto_format=1

" doxygen
let g:load_doxygen_syntax=1

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_cmake_maker = {
            \ "exe": "cmake",
            \ "args": [".."],
            \ "cwd": "build",
            \ "remove_invalid_entries": 0,
            \ }
let g:neomake_ctest_maker = {
            \ "exe": "ctest",
            \ "args": ["--output-on-failure"],
            \ "cwd": "build",
            \ "remove_invalid_entries": 0,
            \ }
let g:neomake_cargotest_maker = {
            \ "exe": "cargo",
            \ "args": ["test"],
            \ "remove_invalid_entries": 0,
            \}
nmap <Leader>nb :Neomake!<CR>
nmap <Leader>nt :Neomake! ctest<CR>
nmap <Leader>nc :Neomake! cmake<CR>
nmap <Leader>ct :Neomake! cargotest<CR>
let g:neomake_cpp_enabled_makers = ["clangtidy", "clangcheck"]
let g:neomake_cpp_clangcheck_args = ["-p", "build"]
let g:neomake_cpp_clangtidy_args = ["-p", "build"]
