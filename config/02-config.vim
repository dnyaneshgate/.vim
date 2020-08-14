" -- bootstrap -----------------------------------------------------------------

set encoding=utf-8                          " set vim encoding to UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set nocompatible                            " the future is now, use vim defaults instead of vi ones
set nomodeline                              " disable mode lines (security measure)
set history=1000                            " boost commands and search patterns history
set undolevels=1000                         " boost undo levels
set noshelltemp                             " use pipes instead of temp files for shell commands
set timeoutlen=500                          " time in milliseconds for a key sequence to complete
set updatetime=100                          " default updatetime 4000ms is not good for async update
if exists("+shellslash")
    set shellslash                          " expand filenames with forward slash
endif


" -- backup and swap files -----------------------------------------------------

set nobackup                                " enable backup files
set nowritebackup                           " enable backup files
set noswapfile                              " enable swap files (useful when loading huge files)

let s:vimdir = g:root_dir
let &backupdir=s:vimdir . "/backup"         " backups location
let &directory=s:vimdir . "/tmp"            " swap location

if exists("*mkdir")
    if !isdirectory(s:vimdir)
        call mkdir(s:vimdir, "p")
    endif
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
endif

set backupskip+=*.tmp                                       " skip backup for *.tmp

if has("persistent_undo")
    let &undodir=&backupdir
    set undofile                                            " enable persistent undo
endif

if has('nvim')
    let &viminfo=&viminfo . ",n" . s:vimdir . "/.nviminfo"  " viminfo location
else
    let &viminfo=&viminfo . ",n" . s:vimdir . "/.viminfo"   " viminfo location
endif




" -- file type detection -------------------------------------------------------

filetype on                 " /!\ doesn't play well with compatible mode
filetype plugin on          " trigger file type specific plugins
filetype indent on          " indent based on file type syntax




" -- command mode --------------------------------------------------------------

set wildmenu                                            " enable tab completion menu
set wildmode=longest:full,full                          " complete till longest common string, then full
set wildignore+=*~,*/tmp/*,*.o,*.obj,*.so,*.so.*,*.a,*.la,*.rbc,*.pyc,__pycache__,cscope.*,.ccls*
if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
if exists ("&wildignorecase")
    set wildignorecase
endif

" sudo then write
cabbrev w!! w !sudo tee % >/dev/null

" CTRL+C closes the command window
if has("autocmd")
    augroup command
        autocmd!
        autocmd CmdwinEnter * noremap <buffer> <silent> <C-c> <ESC>:q<CR>
    augroup END
endif





" -- display -------------------------------------------------------------------

set title                               " change the terminal title
set lazyredraw                          " do not redraw when executing macros
set report=0                            " always report changes
set cursorline                          " highlight current line
set magic                               " For regular expressions turn magic on
set showmatch                           " Show matching brackets when text indicator is over them
set mat=2                               " How many tenths of a second to blink when matching brackets
set ruler
set number
set relativenumber
set noshowmode                          " do not display vim modes (INSERT/VISUAL/NORMAL)
set noerrorbells                        " shut up
set visualbell t_vb=                    " use visual bell instead of error bell
set mousehide                           " hide mouse pointer when typing
set showcmd                             " show partial command line (default)
set cmdheight=1                         " height of the command line
set shortmess=astToO                    " abbreviate messages
set shortmess+=I                        " disable the welcome screen
set linespace=2                         " ease reading in GUI mode by inserting space between lines
set laststatus=2                        " always show statusline
if has("patch-8.1.1564")
    set signcolumn=number               " Recently vim can merge signcolumn and number column into one
else
    set signcolumn=yes                  " always show sogncolumn
endif
" set modeline                            " use modeline overrides
" set modelines=10

if has("autocmd")
    augroup vim
        autocmd!
        autocmd FileType vim set textwidth=500
    augroup END
    augroup windows
        autocmd!
        autocmd VimResized * :wincmd = " resize splits when the window is resized
    augroup END
endif

if has("gui_running")
    set cursorcolumn    " highlight current column
endif

" set nolist                            " hide unprintable characters
if has('gui_running')
        set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀
        let &showbreak = '↳'
else
        "set showbreak=↪\
        let &showbreak = '↳'
        "set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·,extends:⟩,precedes:⟨
        set list listchars=tab:»·,trail:·,extends:>
endif

if has("autocmd")
    " temporarily disable unprintable characters when entering insert mode
    augroup list
        autocmd!
        autocmd InsertEnter * let g:restorelist=&list | :set nolist
        autocmd InsertLeave * let &list=g:restorelist
    augroup END

    " toggle cursorlinewhen switch mode
    augroup cul
        autocmd!
        autocmd InsertEnter * set cul
        autocmd InsertLeave * set nocul
    augroup END
endif

if (&t_Co > 2 || has("gui_running")) && has("syntax")
     syntax on    " turn syntax highlighting on, when terminal has colors or in GUI
endif

if has("gui_running")       " GUI mode
    set guioptions-=T       " remove useless toolbar
    set guioptions+=c       " prefer console dialogs to popups
endif

" highlight SCM merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

if has("folding")
    set foldenable                          " enable folding
    set foldmethod=syntax                   " fold based on syntax highlighting
    set foldlevelstart=99                   " start editing with all folds open
endif


" -- buffers -------------------------------------------------------------------

set nobomb                                  " don't clutter files with Unicode BOMs
set nobinary
set hidden                                  " enable switching between buffers without saving
set switchbuf=usetab                        " switch to existing tab then window when switching buffer
set autoread                                " auto read files changed only from the outside of ViM
if has("persistent_undo") && (&undofile)
    set autowriteall                        " auto write changes if persistent undo is enabled
endif
set fsync                                   " sync after write
set confirm                                 " ask whether to save changed files
set ffs=unix,dos                            " Use Unix as the standard file type

if has("autocmd")
    augroup trailing_spaces
        autocmd!
        "autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces before saving
    augroup END
    augroup restore_cursor
        " restore cursor position to last position upon file reopen
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
    augroup END
endif


" -- navigation ----------------------------------------------------------------

set startofline                             " move to first non-blank of the line when using PageUp/PageDown
set scrolljump=1                            " minimal number of lines to scroll vertically
set scrolloff=4                             " number of lines to keep above and below the cursor
                                            "     typing zz sets current line at the center of window
set sidescroll=1                            " minimal number of columns to scroll horizontally
set sidescrolloff=4                         " minimal number of columns to keep around the cursor
set whichwrap=b,s,<,>                       " allow cursor left/right key to wrap to the
                                            " previous/next line
                                            " omit [,] as we use virtual edit in insert mode



" -- editing -------------------------------------------------------------------

set clipboard=unnamed,unnamedplus   " copy to clipboard
set nowrap                          " don't wrap lines
set linebreak                       " yet if enabled break at word boundaries
set nojoinspaces                    " insert only one space after '.', '?', '!' when joining lines
set showmatch                       " briefly jumps the cursor to the matching brace on insert
set matchtime=4                     " blink matching braces for 0.4s

set matchpairs+=<:>                 " make < and > match
runtime macros/matchit.vim          " enable extended % matching

" set virtualedit=insert            " allow the cursor to go everywhere (insert)
" set virtualedit+=onemore          " allow the cursor to go just past the end of line
" set virtualedit+=block            " allow the cursor to go everywhere (visual block)

set backspace=indent,eol,start      " allow backspacing over everything (insert)

set expandtab                       " insert spaces instead of tab, CTRL-V+Tab inserts a real tab
set tabstop=4                       " 1 tab == 4 spaces
set softtabstop=4                   " number of columns used when hitting TAB in insert mode
set smarttab                        " insert tabs on the start of a line according to shiftwidth
set autoindent                      " enable autoindenting
set smartindent                     " enable smart indent
set copyindent                      " copy the previous indentation on autoindenting
set shiftwidth=4                    " indent with 4 spaces
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set lbr                             " Linebreak on 500 characters
set tw=500

" quick insertion of newline in normal mode with <CR>
" if has("autocmd")
"     nnoremap <silent> <CR> :put=''<CR>
"     augroup newline
"         autocmd!
"         autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"         autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
"     augroup END
" endif

" set completeopt=longest,menuone,preview " better completion
set completeopt=menuone,noinsert,noselect,preview


" -- searching -----------------------------------------------------------------

set wrapscan        " wrap around when searching
set incsearch       " show match results while typing search pattern
if (&t_Co > 2 || has("gui_running"))
    set hlsearch    " highlight search terms
endif

" temporarily disable highlighting when entering insert mode
if has("autocmd")
    augroup hlsearch
        autocmd!
        autocmd InsertEnter * let g:restorehlsearch=&hlsearch | :set nohlsearch
        autocmd InsertLeave * let &hlsearch=g:restorehlsearch
    augroup END
endif
set ignorecase      " case insensitive search
set smartcase       " case insensitive only if search pattern is all lowercase (smartcase requires ignorecase)
set gdefault        " search/replace globally (on a line) by default





" -- spell checking ------------------------------------------------------------

set spelllang=en        " English only
set nospell             " disabled by default

if has("autocmd")
    augroup spell
        autocmd!
        "autocmd FileType vim setlocal spell " enabled when editing .vimrc
    augroup END
endif


" -- abbreviations --------------------------------------------------------------

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


" Don't persist options and mappings because it can corrupt sessions.
set sessionoptions-=options
set sessionoptions-=folds


" hides carriage returns in case of mixed line endings
for i in ['cterm', 'gui']
  for j in ['fg', 'bg']
    let c = synIDattr(hlID('Normal'), 'bg', i)
    if (!empty(c))
        exec 'highlight CarriageReturn ' . i . j . '=' . c
    endif
  endfor
endfor
if hlID('CarriageReturn')
    match CarriageReturn /\r$/
endif
