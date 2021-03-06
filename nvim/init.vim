call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cespare/vim-toml'
Plug 'codeindulgence/vim-tig'
Plug 'euclio/vim-markdown-composer'
Plug 'farmergreg/vim-lastplace'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kana/vim-operator-user'
Plug 'klen/python-mode'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/rust-doc.vim'
Plug 'rhysd/vim-gfm-syntax'
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
let maplocalleader=' '

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set tabstop=4
set shiftwidth=4

" neomake
augroup NeoMake
    autocmd BufWritePost * Neomake
augroup end
let g:neomake_cmake_maker = { 'exe': 'cmake', 'args': ['--build', 'build'] }
let g:neomake_ninja_maker = { 'exe': 'ninja', 'args': ['-C', 'build'] }
let g:neomake_ninjatest_maker = { 'exe': 'ninja', 'args': ['-C', 'build', 'test'] }

" rust.vim
let g:rustfmt_autosave = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-airline-themes
let g:airline_theme = 'solarized'

" vim-gitgutter
let g:gitgutter_map_keys = 1

" rusty-tags
augroup RustyTags
    autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
    autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
augroup end

" vimtex
let g:vimtex_view_method = 'skim'
