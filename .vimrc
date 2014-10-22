syntax on
set nocompatible
filetype plugin indent on
execute pathogen#infect()

" Colorscheme
colorscheme slate

" lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2
let g:localvimrc_persistence_file = '/Users/gadomski/.lvimrc_persistent'

" Mouse
set mouse=a

" Leaders
let mapleader=","
let maplocalleader = ","

" Spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Hilights
set hls
set hlsearch

" Searching
set incsearch

" Line numbers
set number

" Word wrapping
set wrap linebreak nolist nospell textwidth=0 wrapmargin=0 nojoinspaces

" Filetypes
runtime! ftplugin/man.vim

" Titlestring
auto BufEnter * let &titlestring = "[". getcwd() . "] :: " . expand("%:p")

" Latex-box preferred
let g:tex_flavor = "latex"
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 2
let g:LatexBox_viewer = "open"
let g:LatexBox_quickfix = 2

" R stuff
command! RCdUp :call g:SendCmdToR("setwd('..')")
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
vmap <localleader>rD :RCdUp<CR>
nmap <localleader>rD :RCdUp<CR>
vmap <localleader>da :RLoadPackage<CR>
nmap <localleader>da :RLoadPackage<CR>
nmap <LocalLeader>kr :call g:SendCmdToR('rm(list=ls(all.names=TRUE)); unlink("cache/*")')<CR>
let vimrplugin_openpdf = 1

" Other useful mappings
nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" riv
let g:riv_file_link_style = 2

" NERDtree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeChDirMode = 2

" NERDTree Open
let g:nerdtree_plugin_open_cmd = 'open'

" BBye
nnoremap <localleader>bd :Bdelete<CR>

" Extradite
let g:extradite_resize = 0
let g:extradite_showhash = 1

" DoxygenToolkit
let g:DoxygenToolkit_authorName="Pete Gadomski <pete.gadomski@gmail.com"
let g:DoxygenToolkit_cinoptions="^-s"
let g:DoxygenToolkit_commentType="C++"
let g:DoxygenToolkit_briefTag_pre=""
" let g:load_doxygen_syntax=1

" Syntastic
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": ["coffeescript"]
            \ }
let g:syntastic_javascript_checkers = ['jslint']
nnoremap <localleader>sc :SyntasticCheck<CR>

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" Windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
