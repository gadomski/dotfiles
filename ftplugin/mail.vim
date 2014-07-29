let s:sig_dir='/Users/gadomski/.mutt/'

function! MailChangeSignature(filename)
    call cursor(1,1)
    let signature = search("^-- $") + 1
    if signature == 1
        return
    endif
    silent exe signature.',$d'
    silent exe 'read '.s:sig_dir.a:filename
    echo 'Changed signature to contents of '.a:filename
endfunction

function! MailConditionallyChangeSignature(pattern, filename)
    call cursor(1,1) 
    let pattern_found = search(a:pattern)
    if pattern_found > 0
        call MailChangeSignature(a:filename)
    endif
endfunction

function! MailDeleteQuotedReply()
    let quote_begin = search("^>") - 2
    if quote_begin == -2
        return
    endif
    let quote_end = search("^$")
    if quote_end == 0
        return
    endif
    silent exe quote_begin.','.quote_end.'d'
endfunction

call MailConditionallyChangeSignature("^From:.*@gru.org", "sig.gru")

call cursor(1,1) 
call search('^$')

set spell

nnoremap <localleader>dq :call MailDeleteQuotedReply()<cr>
