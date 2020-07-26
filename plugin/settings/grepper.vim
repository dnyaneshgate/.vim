let g:grepper = {}            " initialize g:grepper with empty dictionary
runtime plugin/grepper.vim " initialize g:grepper with default values

let g:grepper.tools = []
let g:grepper.repo = ['.git', '.hg', '.svn']

if executable('rg')
    let g:grepper.tools += ['rg']
endif

if executable('git')
    let g:grepper.tools += ['git']
endif

if executable('ack')
    let g:grepper.tools += ['ack']
endif

if executable('ack-grep')
    let g:grepper.tools += ['ack-grep']
endif

if executable('ggrep')
    let g:grepper.tools += ['ggprep']
endif

if executable('grep')
    let g:grepper.tools += ['grep']
endif

if executable('findstr')
    let g:grepper.tools += ['findstr']
endif

if exists('g:grepper.git')
    let g:grepper.git.grepprg = 'git grep -nI --untracked'
endif

if exists('g:grepper.rg')
    let g:grepper.rg.grepprg .= ' --smart-case --follow'
endif

let g:grepper.highlight = 1
let g:grepper.next_tool = '<leader>g'

" nnoremap <leader>g :Grepper -tool rg<cr>
" nnoremap <leader>G :Grepper -tool rg -buffers<cr>

" nmap gs  <plug>(GrepperOperator)
" xmap gs  <plug>(GrepperOperator)

nnoremap <silent> <leader>g :Grepper <cword><cr>
if has('nvim')
    nnoremap <silent> <leader>f :execute 'F '.expand('<cword>').' .'<CR>
else
    nnoremap <silent> <leader>f :execute 'F '.expand('<cword>').' **/*.*'<CR>
endif
