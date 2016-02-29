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

" Smart case-sensitivity in searching
set smartcase

" Tab mode in the command bar
set wildmenu

" Delete autoindents
set backspace=indent

" Local leader
let mapleader=" "

" Load man.vim
runtime! ftplugin/man.vim


"""""""""""""""""
" Plugin zone
"""""""""""""""""

" vim-projectionist
let g:projectionist_heuristics = {
            \ "build/build.ninja": {
            \   "*": {
            \     "make": "ninja\ -C\ build",
            \     "dispatch": "ninja\ -C build && CTEST_OUTPUT_ON_FAILURE=1\ ninja\ -C\ build test"
            \   }
            \ }
            \ }

" airline
let g:airline#extensions#tabline#enabled = 1

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ["clang_check"]
let g:syntastic_c_clang_check_post_args = "-p build/compile_commands.json"
let g:syntastic_cpp_checkers = ["clang_check"]
let g:syntastic_cpp_clang_check_post_args = "-p build/compile_commands.json"

" vim-tags
let g:vim_tags_ctags_binary="noglob ctags"
let g:vim_tags_auto_generate=0

" rust.vim
let g:rustfmt_autosave=1

" clang-format
augroup ClangFormatSettings
    autocmd!
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END

" doxygen
let g:load_doxygen_syntax=1
