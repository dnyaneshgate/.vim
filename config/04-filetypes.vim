if has("autocmd")
  augroup makefile
    autocmd!
    " don't expand tab to space in Makefiles
    autocmd FileType make setlocal noexpandtab
  augroup END
endif

augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END



" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make/cmake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=0
    \ formatoptions+=croq softtabstop=4
    \ backspace=indent,eol,start
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    \ nofoldenable foldmethod=indent foldtext=none

let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
"au FileType python syn keyword pythonDecorator True None False self
au FileType python syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/
au FileType python syntax sync minlines=10000




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript
    \ setl tabstop=4 |
    \ setl shiftwidth=4 |
    \ setl expandtab softtabstop=4 fen nocindent
au FileType javascript call JavaScriptFold()

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType rust setlocal
  \ expandtab shiftwidth=4 tabstop=4 colorcolumn=0
  \ backspace=indent,eol,start
  \ nofoldenable foldmethod=syntax




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType json setlocal nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType xml setl nowrap expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coffee script
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType coffee setlocal foldmethod=indent



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType yml setlocal tabstop=4 shiftwidth=4 expandtab
au FileType yaml setlocal tabstop=4 shiftwidth=4 expandtab
au FileType yaml.docker-compose setlocal tabstop=4 shiftwidth=4 expandtab



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git commit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType gitcommit call setpos('.', [0, 1, 1, 0])





""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html
