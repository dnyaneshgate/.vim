let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_map_showproto = ''

if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "SunOS"
        if executable("ectags")
            let g:tagbar_ctags_bin = "ectags"
        elseif executable("/opt/csw/bin/ectags")
            let g:tagbar_ctags_bin = "/opt/csw/bin/ectags"
        endif
    endif
endif

" toggle tagbar with <C-B>
nnoremap <silent> <C-B> :TagbarToggle<CR>
