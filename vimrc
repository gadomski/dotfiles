syntax on
set nocompatible
filetype plugin indent on
execute pathogen#infect()


"
" General configuration
"

" Colors
set background=dark
colorscheme solarized

" Leaders
let mapleader=","
let maplocalleader = ","

" Mouse
set mouse=a

" Spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Hilights
set hls

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" Line numbers
set relativenumber
set number

" Word wrapping
set wrap linebreak nolist nospell textwidth=0 wrapmargin=0 nojoinspaces

" Titlestring
auto BufEnter * let &titlestring = "[". getcwd() . "] :: " . expand("%:p")

" Windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

" GUI options
set guioptions-=rL
set guioptions+=m

" Other useful mappings
nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>
nnoremap <localleader>w :w<CR>
nnoremap <localleader>mm :Make<CR>
nnoremap <localleader>md :Dispatch<CR>
nnoremap <localleader>co :Copen<CR>
nnoremap <localleader>cl :ccl<CR>
nnoremap <localleader>lc :lcl<CR>
nnoremap <localleader>gs :Gstatus<CR>
nnoremap <localleader>cm :!cd build && cmake ..<CR>
nnoremap <localleader>cf :ClangFormat<CR>
vnoremap <localleader>cf :ClangFormat<CR>
nnoremap <localleader>bd :Bdelete<CR>
nnoremap <localleader>sc :SyntasticCheck<CR>


"
" Plugins and filetypes
"

" Filetypes
runtime! ftplugin/man.vim

" Latex-box preferred
let g:tex_flavor = "latex"
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 2
let g:LatexBox_viewer = "open"
let g:LatexBox_quickfix = 2

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" NERDtree
let NERDTreeChDirMode = 2

" Extradite
let g:extradite_resize = 0
let g:extradite_showhash = 1

" Syntastic
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": ["coffeescript"]
            \ }
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_clang_check_post_args = '-p build/compile_commands.json'

" Clang format
let g:clang_format#detect_style_file = 1


" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files | grep -v vendor/']

" Projectionist
let g:projectionist_heuristics = {
            \ "CMakeLists.txt&build/build.ninja": {
            \   "*": {
            \       "make": "ninja-default-in-build-dir",
            \       "dispatch": "ninja-test-in-build-dir"
            \   }
            \ }}

" Dispatch
let g:dispatch_compilers = {
            \ "ninja-default-in-build-dir": "clang-gtest",
            \ "ninja-test-in-build-dir": "clang-gtest"
            \ }
