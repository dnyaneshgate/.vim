syntax enable


" Enable 256 colors palette in Gnome Terminal
set t_Co=256

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

set background=dark
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

try    
    colorscheme gruvbox
catch
    colorscheme desert
endtry
