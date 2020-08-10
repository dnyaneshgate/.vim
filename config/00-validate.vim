if has('vim_starting')
    set nocompatible               " Be iMproved
endif

if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
endif

if !executable("git")
    echoerr "You have to install git"
    execute "q!"
endif
