let mapleader='\'       " change leader key to ,
let maplocalleader='\'  " change local leader key to ,


" CTRL+A moves to start of line in command mode
cnoremap <C-a> <home>
" CTRL+E moves to end of line in command mode
cnoremap <C-e> <end>

" inverts display of unprintable characters
nnoremap <silent> <leader>l :set list! list?<CR>


" cd to the directory of the current buffer
nnoremap <silent> <leader>cd :cd %:p:h<CR>

" Buffer navigation
nnoremap <silent><M-Right> :bn<CR>
nnoremap <silent><M-Left> :bp<CR>
nnoremap <silent><leader>x :bnext<cr>
nnoremap <silent><leader>z :bprevious<cr>

" Open Buffer
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>

"" Close buffer
nnoremap <silent> <leader>bc :bd<CR>

" close all buffers
nnoremap <silent> <leader>ba :bufdo bd<cr>

" switch between last two files
nnoremap <leader><Tab> <c-^>

" <leader>w writes the whole buffer to the current file
nnoremap <silent> <leader>w :w!<CR>
inoremap <silent> <leader>w <ESC>:w!<CR>

" <leader>W writes all buffers
nnoremap <silent> <leader>W :wa!<CR>
inoremap <silent> <leader>W <ESC>:wa!<CR>


" toggle folds
" nnoremap <Space> zA
" vnoremap <Space> zA



" scroll slightly faster
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
map <C-Up> <C-y>
map <C-Down> <C-e>


" switch between windows by hitting <Tab> twice
nnoremap <silent> <Tab><Tab> <C-w>w

" window resizing
map <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" <leader>q quits the current window
nnoremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <ESC>:q<CR>

" create a new tab
nnoremap <silent> <leader>t :tabnew<CR>


" make Y consistent with C and D by yanking up to end of line
noremap Y y$

" CTRL-S saves file
"nnoremap <C-s> :w<CR>

" inverts paste mode
nnoremap <silent> <leader>pp :set paste! paste?<CR>
" same in insert mode
set pastetoggle=<leader>pp



" <leader>rt retabs the file, preserve cursor position
nnoremap <silent> <leader>rt :call Preserve(":retab")<CR>

" <leader>s removes trailing spaces
noremap <silent> <leader>s :call Preserve("%s/\\s\\+$//e")<CR>

" <leader>$ fixes mixed EOLs (^M)
noremap <silent> <leader>$ :call Preserve("%s/<C-V><CR>//e")<CR>

" use <leader>d to delete a line without adding it to the yanked stack
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" use <leader>c to replace text without yanking replaced text
nnoremap <silent> <leader>c "_c
vnoremap <silent> <leader>c "_c

" yank/paste to/from the OS clipboard
map <silent> <leader>y "+y
map <silent> <leader>Y "+Y
map <silent> <leader>p "+p
map <silent> <leader>P "+P

" paste without yanking replaced text in visual mode
vnoremap <silent> p "_dP
vnoremap <silent> P "_dp

" reselect last selection after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" preserve cursor position when joining lines
nnoremap J :call Preserve("normal! J")<CR>

" split line and preserve cursor position
nnoremap S :call Preserve("normal! i\r")<CR>

" select what was just pasted
nnoremap <leader>v V`]

" <C-Space> triggers completion in insert mode
inoremap <C-Space> <C-P>
if !has("gui_running")
  inoremap <C-@> <C-P>
endif

" move current line down
noremap <silent>- :m+<CR>
" move current line up
noremap <silent>_ :m-2<CR>
" move visual selection down
vnoremap <silent>- :m '>+1<CR>gv=gv
" move visual selection up
vnoremap <silent>_ :m '<-2<CR>gv=gv


nnoremap Q <NOP>

" make dot work in visual mode
vnoremap . :normal .<CR>

" make v enter blockwise visual mode, and CTRL-V enter visual mode
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v


" temporarily disable search highlighting
nnoremap <silent> <leader><Space> :nohlsearch<CR>:match none<CR>:2match none<CR>:3match none<CR>

" highlight all instances of the current word where the cursor is positioned
nnoremap <silent> <leader>hs :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" use <leader>h1, <leader>h2, <leader>h3 to highlight words in different colors
nnoremap <silent> <leader>h1 :highlight Highlight1 ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow<CR> :execute 'match Highlight1 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>h2 :highlight Highlight2 ctermfg=0 ctermbg=51 guifg=Black guibg=Cyan<CR> :execute '2match Highlight2 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>h3 :highlight Highlight3 ctermfg=0 ctermbg=46 guifg=Black guibg=Green<CR> :execute '3match Highlight3 /\<<C-r><C-w>\>/'<cr>


" replace word under cursor
nnoremap <leader>; :%s/\<<C-r><C-w>\>//<Left>


" center screen on next/previous match, blink current match
noremap <silent> n nzzzv:call BlinkMatch(0.2)<CR>
noremap <silent> N Nzzzv:call BlinkMatch(0.2)<CR>


" search for visually selected areas
xnoremap * <ESC>/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR><CR>
xnoremap # <ESC>?<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR><CR>
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" prepare search based on visually selected area
xnoremap / <ESC>/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR>

" prepare substitution based on visually selected area
xnoremap & <ESC>:%s/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR>/



nnoremap <silent> <C-F2> :BookmarkToggle<CR>
nnoremap <silent> <F26> :BookmarkToggle<CR>

nnoremap <silent> <F2> :BookmarkNext<CR>

nnoremap <silent> <S-F2> :BookmarkPrev<CR>
nnoremap <silent> <F14> :BookmarkPrev<CR>

nnoremap <silent> <C-S-F2> :BookmarkClearAll<CR>

nnoremap <silent> <leader><leader> :BookmarkToggle<CR>
nnoremap <silent> <leader>C :BookmarkClearAll<CR>


" fold mapping
nnoremap <silent> z0 :setl foldlevel=0<CR>
nnoremap <silent> z1 :setl foldlevel=1<CR>
nnoremap <silent> z2 :setl foldlevel=2<CR>
nnoremap <silent> z3 :setl foldlevel=3<CR>
nnoremap <silent> z4 :setl foldlevel=4<CR>
nnoremap <silent> z5 :setl foldlevel=5<CR>
nnoremap <silent> z6 :setl foldlevel=6<CR>
nnoremap <silent> z7 :setl foldlevel=7<CR>
nnoremap <silent> z8 :setl foldlevel=8<CR>
nnoremap <silent> z9 :setl foldlevel=9<CR>



"" Split
noremap <silent> <Leader>h :<C-u>split<CR>
noremap <silent> <Leader>v :<C-u>vsplit<CR>

"" Git
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>



"jump to first non-whitespace on line, jump to begining of line if already at first non-whitespace
map <silent> <Home> :call LineHome()<CR>:echo<CR>
imap <silent> <Home> <C-R>=LineHome()<CR>
map ^[[1~ :call LineHome()<CR>:echo<CR>
imap ^[[1~ <C-R>=LineHome()<CR>
function! LineHome()
  let x = col('.')
  execute "normal ^"
  if x == col('.')
    execute "normal 0"
  endif
  return ""
endfunction

" jump to the last non-whitespace char on line, or eol if already there
map <silent> <End> :call LineEnd()<CR>:echo<CR>
imap <silent> <End> <C-R>=LineEnd()<CR>
function! LineEnd()
  let x = col('.')
    execute "normal g_"
  if x == col('.')
    execute "normal $"
  endif
 return ""
endfunction


" Remove the Windows ^M - when the encodings gets messed up
" nnoremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" nnoremap <leader>M :%s/^\r$//g
