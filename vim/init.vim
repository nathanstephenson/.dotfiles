" Persist undo
set undofile
set undodir=$HOME/.config/vim/undodir//

" Set swap file location
set directory=$HOME/.config/vim/swap//

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
nmap K i<cr><Esc>

" Center screen after ctrl+d or ctrl+u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Jump to last file visited
nnoremap <leader><leader> :e #<cr>

" Set indentation size
set shiftwidth=4

" Go: format on save
command! GoFmt call GoFmt()

augroup go_autocmd
  autocmd BufWritePre *.go GoFmt
augroup END

function! GoFmt()
  let saved_view = winsaveview()
  silent %!gofmt
  if v:shell_error > 0
    cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
    silent undo
    cwindow
  endif
  call winrestview(saved_view)
endfunction
