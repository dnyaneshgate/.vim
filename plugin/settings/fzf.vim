" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

if executable('git')
    set grepprg=git\ grep\ -nI\ --untracked
endif

let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" ripgrep
if executable('rg')
    let s:ignore_files  = "'!{.git,*.o,*.obj,*.so,*.so.*,*.a,*.la,*.rbc,*.pyc,__pycache__,cscope.*,*ccls*}'"
    let s:rg_search_cmd = "rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --no-ignore --hidden --follow --glob " . s:ignore_files . " "
    let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore --hidden --follow --glob " . s:ignore_files
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow

    function! RipgrepFzf(query, fullscreen)
        let command_fmt = s:rg_search_cmd . " -- %s || true"
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -bang -nargs=* Find     call fzf#vim#grep(s:rg_search_cmd . shellescape(<q-args>) . ' | tr -d "\017"', 1, <bang>0)
    command! -bang -nargs=* FindWord call fzf#vim#grep(s:rg_search_cmd . shellescape(expand('<cword>')), 1, <bang>0)
    command! -bang -nargs=* RG       call RipgrepFzf(<q-args>, <bang>0)
    command! -bang -nargs=* RGWord   call RipgrepFzf(expand('<cword>'), <bang>0)
endif

nnoremap <silent> <C-p>     :FZF -m<CR>

if executable('rg')
    nnoremap <silent> <leader>f :FindWord<cr>
    nnoremap <silent> <leader>F :RGWord<cr>
endif
