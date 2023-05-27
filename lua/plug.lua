local Plug = vim.fn['plug#']
vim.call("plug#begin", '~/.vim/plugged')

Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.1'})
Plug('ThePrimeagen/harpoon')

vim.call("plug#end")

require('plug.telescope')
require('plug.harpoon')
