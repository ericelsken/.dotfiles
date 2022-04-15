if exists('+colorcolumn')
    set colorcolumn=50,72
endif

if has('autocmd')
    augroup gitcommit_rc_autogroup
        autocmd!
        autocmd BufEnter COMMIT_EDITMSG :call cursor(2, 1)
        autocmd BufEnter COMMIT_EDITMSG :startinsert
    augroup END
endif
