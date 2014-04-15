let g:ledger_fillstring = '·'
let g:ledger_maxwidth = 72
nmap <localleader>la :call ledger#transaction_date_set(line('.'), 'auxiliary')<CR>
vmap <localleader>la :call ledger#transaction_date_set(line('.'), 'auxiliary')<CR>
nmap <localleader>lp :call ledger#transaction_date_set(line('.'), 'primary')<CR>
vmap <localleader>lp :call ledger#transaction_date_set(line('.'), 'primary')<CR>
nmap <localleader>l! :call ledger#transaction_state_set(line('.'), '!')<CR>
vmap <localleader>l! :call ledger#transaction_state_set(line('.'), '!')<CR>
nmap <localleader>l* :call ledger#transaction_state_set(line('.'), '*')<CR>
vmap <localleader>l* :call ledger#transaction_state_set(line('.'), '*')<CR>
nmap <localleader>l0 :call ledger#transaction_state_set(line('.'), '')<CR>
vmap <localleader>l0 :call ledger#transaction_state_set(line('.'), '')<CR>
nmap <localleader>lt :r! date "+\%Y/\%m/\%d"<CR>
vmap <localleader>lt :r! date "+\%Y/\%m/\%d"<CR>

command! LedgerAutosync :!ledger-autosync --slow --max 5 --assertions >> %
