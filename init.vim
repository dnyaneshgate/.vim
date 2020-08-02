"***************************************************************************"
"       VIM builtin API documentation.                                      "
"       http://vimdoc.sourceforge.net/htmldoc/usr_41.html                   "
"***************************************************************************"
"       VIM script tutorial                                                 "
"       http://learnvimscriptthehardway.stevelosh.com/                      "
"***************************************************************************"


for f in split(glob(expand('~/.vim/config/').'*.vim'), '\n')
    exe 'source' f
endfor

if !exists('g:not_finish_vimplug')
    source ~/.vim/plugin/init.vim
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
endif
