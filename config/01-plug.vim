if has('vim_starting')
    set nocompatible               " Be iMproved
endif

if has('nvim')
    let g:root_dir = expand("$HOME/.config/nvim")
else
    let g:root_dir = expand("$HOME/.vim")
endif

let vimplug_path=expand(g:root_dir)

let &rtp .= ','.expand($VIMRUNTIME)
let &rtp .= ','.expand(vimplug_path)

let vimplug_exists = expand(vimplug_path . "/autoload/plug.vim")

if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
endif

if !executable("git")
    echoerr "You have to install git"
    execute "q!"
endif

if !filereadable(vimplug_exists)
    echo "Installing Vim-Plug..."
    echo ""
    execute "!curl -vfLo ". vimplug_exists ." --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

call plug#begin(expand(vimplug_path.'/plugged'))
    Plug 'airblade/vim-gitgutter'
    Plug 'benmills/vimux'
    Plug 'chrisbra/csv.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dense-analysis/ale'
    Plug 'ervandew/supertab'
    Plug 'easymotion/vim-easymotion'
    Plug 'flazz/vim-colorschemes'
    Plug 'godlygeek/tabular'
    Plug 'justinmk/vim-sneak'
    Plug 'Konfekt/FastFold'
    Plug 'luochen1990/rainbow'
    Plug 'majutsushi/tagbar'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-grepper'
    Plug 'morhetz/gruvbox'
    " Teach VIM to recognize modified Function keys (in addition to Page and Arrow keys)
    " produced by the xterm-256color terminal when Vim runs under the TERM=screen-256color environment.
    " https://sunaku.github.io/vim-256color-bce.html
    Plug 'nacitar/terminalkeys.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'pseewald/anyfold'
    Plug 'sheerun/vim-polyglot'
    Plug 'sjl/clam.vim'
    Plug 'sjl/splice.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-shell'
    "Plug 'xolox/vim-easytags'
call plug#end()
