call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cespare/vim-toml'
Plug 'farmergreg/vim-lastplace'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kana/vim-operator-user'
Plug 'klen/python-mode'
Plug 'neomake/neomake'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/rust-doc.vim'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax enable
set background=dark
colorscheme solarized

let mapleader=' '

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set tabstop=4
set shiftwidth=4

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_cmake_maker = { 'exe': 'cmake', 'args': ['--build', 'build'] }
let g:neomake_ninja_maker = { 'exe': 'ninja', 'args': ['-C', 'build'] }
let g:neomake_ninjatest_maker = { 'exe': 'ninja', 'args': ['-C', 'build', 'test'] }

" neofmt
autocmd! BufWritePre * Neoformat

" rust.vim
let g:rustfmt_autosave = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-airline-themes
let g:airline_theme = 'solarized'

" vim-gitgutter
let g:gitgutter_map_keys = 1
