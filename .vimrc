syntax on
set nocompatible
filetype plugin indent on
execute pathogen#infect()
colorscheme slate

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

" Filetypes
runtime! ftplugin/man.vim

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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
