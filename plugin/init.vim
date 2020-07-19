" load plugin settings
for f in split(glob(fnamemodify(expand($MYVIMRC), ":h").expand('/settings/').'*.vim'), '\n')
    exe 'source' f
endfor
