if has('nvim') "only use lua function if running from nvim (lua isn't supported in native vim)
	lua require('init')
endif

" set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
" set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
" set hidden " Hide unused buffers
" set autoindent " Indent a new line
" set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
" set splitbelow splitright " Change the split screen behavior
" set wildmenu " Show a more advance menu
set cc=160 " Show at 160 column a border for good code style
" set spell " enable spell check (may need to download language package)

set title " Show file title
set ttyfast " Speed up scrolling in Vim

" let g:neoformat_try_node_exe=1

source ~/.dotfiles/vim/init.vim
