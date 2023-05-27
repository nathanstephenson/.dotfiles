if vim.fn.has('nvim') == 1 then --only use plug if running from nvim (mainly means can use with ideavim)
	require('plug')
end

local HOME = vim.env.HOME
--Persist undo/redo
vim.opt.undofile = true
vim.opt.undodir = {HOME .. '/.vim/undodir'}
--Display relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
--Set scrolling options
vim.opt.scrolloff = 8
--Some servers have issues with backup files
vim.opt.backup = false
vim.opt.writebackup = false
--Set to always use current dir
vim.opt.autochdir = true
--Longer updatetime (default is 4000ms) leads to noticeable delays
vim.opt.updatetime = 300
--Always show singlecolumn, otherwise text would be shifted each time diagnostics appear/disappear
vim.opt.scl = 'yes'

--KEY BINDINGS
--Disable q
--Center screen after ctrl+d or ctrl+u
