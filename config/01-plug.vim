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

if !filereadable(vimplug_exists)
    echo "Installing Vim-Plug..."
    echo ""
    execute "!curl -vfLo ". vimplug_exists ." --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

call plug#begin(expand(vimplug_path.'/plugged'))
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'bazelbuild/vim-bazel'
    Plug 'benmills/vimux'
    Plug 'chrisbra/csv.vim'
    Plug 'ervandew/supertab'
    Plug 'flazz/vim-colorschemes'
    Plug 'godlygeek/tabular'
    Plug 'google/vim-maktaba'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'Konfekt/FastFold'
    Plug 'ludwig/split-manpage.vim'
    Plug 'luochen1990/rainbow'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'pseewald/anyfold'
    Plug 'sheerun/vim-polyglot'
    Plug 'sjl/clam.vim'
    Plug 'sjl/splice.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-shell'
call plug#end()
