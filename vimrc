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


"""""""""""""""""
" Plugin zone
"""""""""""""""""

" vim-projectionist
let g:projectionist_heuristics = {
            \ "build/build.ninja": {
            \   "*": {
            \     "make": "ninja\ -C\ build"
            \   }
            \ }
            \ }

" airline
let g:airline#extensions#tabline#enabled = 1

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
