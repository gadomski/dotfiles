let g:neomake_enabled_makers = ['cargo']
autocmd! BufWritePost * Neomake! cargo
