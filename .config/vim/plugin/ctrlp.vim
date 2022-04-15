"The Silver Searcher.
if executable('ag')
    "Use ag over grep.
    set grepprg=ag\ --nogroup\ --nocolor

    "Use ag in CtrlP for listing files. Respects .gitignore.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    "Silver Searcher is fast enough that CtrlP does not need to cache.
    let g:ctrlp_use_caching = 0
endif
