"***************************************************************************"
"       VIM builtin API documentation.                                      "
"       http://vimdoc.sourceforge.net/htmldoc/usr_41.html                   "
"***************************************************************************"
"       VIM script tutorial                                                 "
"       http://learnvimscriptthehardway.stevelosh.com/                      "
"***************************************************************************"

let s:nvim_home_dir = fnamemodify(expand($MYVIMRC), ":h")

for f in split(glob(expand(s:nvim_home_dir .'/config/').'*.vim'), '\n')
    exe 'source' f
endfor

if !exists('g:not_finish_vimplug')
    exec 'source' expand(s:nvim_home_dir .'/plugin/init.vim')
    if filereadable(expand($HOME . "/.vimrc.local"))
        exec 'source' expand($HOME . '/.vimrc.local')
    endif
endif
