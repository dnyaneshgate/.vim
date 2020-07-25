
let g:ale_linters = {'c': ['gcc'], 'cpp':['gcc']}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_open_list = 1
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_offset = 1000000
let g:ale_warn_about_trailing_whitespace = 1

"let g:ale_sign_error = '>>'
let g:ale_sign_error = '💣'
"let g:ale_sign_warning = '--'
let g:ale_sign_warning = '🚩'
"let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_cpp_gcc_options='-m64 -std=c++11 -Wall'

" Ctrl+j and Ctrl+k to moving between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
