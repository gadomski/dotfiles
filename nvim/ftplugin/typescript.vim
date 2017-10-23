augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
set shiftwidth=2
set softtabstop=2
