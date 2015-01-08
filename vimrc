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

" Moving
nmap j gj
nmap k gk

" Other useful mappings
nnoremap <localleader>as :%!astyle --options=.astylerc<CR>
nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>

" Useful commands
command! Ccmake :!cd build && ccmake ..


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

" BBye
nnoremap <localleader>bd :Bdelete<CR>

" Extradite
let g:extradite_resize = 0
let g:extradite_showhash = 1

" Syntastic
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": ["coffeescript"]
            \ }
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_cpp_checkers = ["gcc", "cppcheck"]
nnoremap <localleader>sc :SyntasticCheck<CR>

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files | grep -v vendor/']

" Tagbar
autocmd FileType * nested :call tagbar#autoopen(0)

" Projectionist
let g:projectionist_heuristics = {
            \ "CMakeLists.txt&build/build.ninja": {
            \   "*": {
            \       "make": "ninja -C build",
            \       "dispatch": "ninja -C build test"
            \   }
            \ }}
