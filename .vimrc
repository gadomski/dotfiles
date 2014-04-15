syntax on
set nocompatible
filetype plugin indent on
execute pathogen#infect()

" No mail maps
" http://tuxproject.de/projects/vim/ftplugin/mail.vim
let no_mail_maps = 1

" Colorscheme
colorscheme slate

" lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2

" Mouse
set mouse=a

" Local leader
let maplocalleader = ","

" Omnicompletion
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Big history
set history=200

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
set wrap linebreak nolist nospell textwidth=0 wrapmargin=0

" Filetypes
runtime! ftplugin/man.vim

" Titlestring
auto BufEnter * let &titlestring = "[". getcwd() . "] :: " . expand("%:p")

" Dispatch stuff
nnoremap <F9> :Make<CR>

" vim-sunflower
let g:sunflower_lat=40
let g:sunflower_long=-105
let g:sunflower_colorscheme_day='solarized'
let g:sunflower_colorscheme_night='solarized'

" Latex-box preferred
let g:tex_flavor = "latex"
let g:LatexBox_latexmk_async = 1
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
let crrel_lidar = { 'path': '~/Projects/crrel-lidar',}
let g:riv_projects = [crrel_lidar]

" vim-calendar
let g:calendar_monday = 1

" NERDtree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeChDirMode = 2

" BBye
nnoremap <localleader>bd :Bdelete<CR>
