" Persist undo
set undofile
set undodir="~/.vim/undodir"

" Display relative line numbers
set number
set relativenumber

" Set scrolling options
set scrolloff=8

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Always use current dir
set autochdir

" Longer updatetime (default is 4000ms) leads to noticeable delays
set updatetime=300

" Always show singlecolumn, otherwise text would be shifted each time
" diagnostics appear or disappear
set signcolumn=yes

" Disable q
nnoremap q <nop>

" K to insert line breaks (inverse of J)
nnoremap <silent> K i<cr><Esc>b

" Center screen after ctrl+d or ctrl+u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
