let g:lsp_signs_enabled = 1             " enable signs
let g:lsp_diagnostics_echo_cursor = 1   " enable echo under cursor when in normal mode

" let g:lsp_signs_error = { 'text': '💣' }
" let g:lsp_signs_warning = { 'text': '🚩' }
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
" let g:lsp_signs_hint = {}

" -------- register lsp --------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'cc', 'h', 'hh', 'hpp'],
      \ })
elseif executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd', '-background-index', '--query-driver=/usr/bin/g++']},
                    \ 'whitelist': ['c', 'cc', 'cpp', 'h', 'hh', 'hpp'],
                    \ })
    augroup end
endif

if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

if executable('java') && filereadable(expand('~/lsp/org.eclipse.lsp4xml-0.3.0-uber.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'lsp4xml',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-noverify',
        \     '-Xmx1G',
        \     '-XX:+UseStringDeduplication',
        \     '-Dfile.encoding=UTF-8',
        \     '-jar',
        \     expand('~/lsp/org.eclipse.lsp4xml-0.3.0-uber.jar')
        \ ]},
        \ 'whitelist': ['xml']
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" -------- autocomplete --------
imap <c-space> <Plug>(asyncomplete_force_refresh)       " force refresh completion

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif       " auto close preview window when completion is done

" -------- debug --------
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
