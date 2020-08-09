highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = ''
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1

nmap <C-F2> <Plug>BookmarkToggle
nmap <F2> <Plug>BookmarkNext
nmap <S-F2> <Plug>BookmarkPrev
" nmap <Leader>i <Plug>BookmarkAnnotate
" nmap <Leader>a <Plug>BookmarkShowAll
" nmap <Leader>c <Plug>BookmarkClear
" nmap <Leader>x <Plug>BookmarkClearAll
" nmap <Leader>kk <Plug>BookmarkMoveUp
" nmap <Leader>jj <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
