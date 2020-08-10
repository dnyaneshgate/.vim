if has('nvim')
    let g:startify_session_dir = g:root_dir . '/nvim-sessions'
else
    let g:startify_session_dir = g:root_dir . '/vim-sessions'
endif

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0
let g:startify_session_autoload = 0
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
\ ]
let g:startify_session_persistence = 1
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
