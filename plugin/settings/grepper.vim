let g:grepper               = {}
let g:grepper.repo          = ['.git', '.hg', '.svn']
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 0
let g:grepper.next_tool     = '<leader>g'
let g:grepper.highlight     = 1
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

nnoremap <silent> <leader>g :Grepper <cword><cr>
nnoremap <leader>g :Grepper -tool git -cword -noprompt<cr>
