" vim compiler file
" Compiler: gtest
" Maintainer: Pete Gadomski <pete.gadomski@gmail.com>
" Last Change: 2015-01-22
if exists("clang-gtest")
    finish
endif
let current_compiler = "clang-gtest"

setlocal errorformat=%Dninja:\ Entering\ directory\ `%f',%f:%l:%c:\ %m,Undefined\ symbols%m,%f:%l:\ Failure,Errors\ while\ running\ CTest:,%ECMake\ Error\ at\ %f:%l\ (message):,%Z\ \ %m
