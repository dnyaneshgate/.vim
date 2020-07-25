if has('vim_starting')
    set nocompatible               " Be iMproved
endif

let vimplug_path=expand("$HOME/.vim")

let &rtp .= ','.expand($VIMRUNTIME)
let &rtp .= ','.expand(vimplug_path)

let vimplug_exists=expand(vimplug_path."/autoload/plug.vim")

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

    " colorschemes
    Plug 'cocopon/iceberg.vim'

    " Teach VIM to recognize modified Function keys (in addition to Page and Arrow keys) produced by the xterm-256color terminal when Vim runs under the TERM=screen-256color environment.
    " https://sunaku.github.io/vim-256color-bce.html
    Plug 'nacitar/terminalkeys.vim'

    " git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Bookmarks
    Plug 'MattesGroeger/vim-bookmarks'

    " Fancy start page
    Plug 'mhinz/vim-startify'

    " code fold
    Plug 'pseewald/anyfold'
    Plug 'Konfekt/FastFold'

    " Comment Plugin
    Plug 'tomtom/tcomment_vim'

    " Improved syntax highlighting
    Plug 'sheerun/vim-polyglot'
    
    " find
    Plug 'mhinz/vim-grepper'

    " tabline/bufferline/statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Programming languages
    Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

    " easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " run shell commands
    Plug 'sjl/clam.vim'

    " Fuzzy file, buffer, mru, tag, etc finder
    Plug 'ctrlpvim/ctrlp.vim'

    " Vim motions on speed
    Plug 'easymotion/vim-easymotion'

    " Automated tag file generation and syntax highlighting of tags
    Plug 'xolox/vim-easytags'

    " wisely add "end" in ruby, endfunction/endif/more in vim script, etc
    Plug 'tpope/vim-endwise'

    " enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'

    " Jump to any location specified by two characters.
    Plug 'justinmk/vim-sneak'

    " managing three-way merges
    Plug 'sjl/splice.vim'

    " vim insert mode completions with Tab
    Plug 'ervandew/supertab'

    " quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'

    " text filtering and alignment
    Plug 'godlygeek/tabular'

    " displays tags in a window, ordered by scope
    Plug 'majutsushi/tagbar'

    " Pairs of handy bracket mappings
    Plug 'tpope/vim-unimpaired'

    " interact with tmux
    Plug 'benmills/vimux'

    " Miscellaneous auto-load Vim scripts
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-shell'

    " Asynchronous Lint Engine
    Plug 'dense-analysis/ale'

call plug#end()
