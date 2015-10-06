let g:ledger_fillstring = '·'
let g:ledger_maxwidth = 72
nmap <localleader>l* :call ledger#transaction_state_set(line('.'), '*')<CR>
vmap <localleader>l* :call ledger#transaction_state_set(line('.'), '*')<CR>

command! LedgerAutosync :!ledger-autosync --slow --max 5 --assertions >> %
