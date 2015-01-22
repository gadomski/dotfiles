" vim compiler file
" Compiler: gtest
" Maintainer: Pete Gadomski <pete.gadomski@gmail.com>
" Last Change: 2015-01-22
if exists("gtest")
    finish
endif
let current_compiler = "gtest"

setlocal errorformat=%f:%l:%c:\ %t%s:\ %m,../%f:%l:\ Failure
