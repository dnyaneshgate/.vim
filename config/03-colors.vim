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


try    
    colorscheme iceberg
    "Normal         xxx ctermfg=223 ctermbg=234 guifg=#ebdbb2 guibg=#1d2021
    "hi Folded ctermbg=234 guibg=#1d2021
    "hi FoldColumn ctermfg=223 ctermbg=234 guifg=#ebdbb2 guibg=#1d2021
catch
    colorscheme desert
endtry
