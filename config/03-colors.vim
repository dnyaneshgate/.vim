syntax enable


" Enable 256 colors palette in Gnome Terminal
set t_Co=256

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif   

if !exists('$TMUX') && has('termguicolors')
    " enable termguicolors if
    "   1. vim support termguicolors
    "   2. not running inside tmux sessions
    set termguicolors
endif

if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
        set t_Co=256
    endif
endif

set background=dark

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

try    
    colorscheme gruvbox
catch
    colorscheme desert
endtry
