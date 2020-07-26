let g:ctrlp_max_files = 0 " unlimited files
let g:ctrlp_open_multiple_files = '1ij' " max 1 window, i=all files as hidden, j=after open, jump to first opened tab/window

let g:ctrlp_root_markers = ['.git']

let g:ctrlp_regexp = 1

if executable('ag')
  let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'ag --nocolor -g "" %s']
elseif executable('ack')
  let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'ack --nocolor -g "" %s']
elseif executable('find')
  let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'find %s -type f']
else
  let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif
