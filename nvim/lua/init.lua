function Map(mode, input, out, opts)
    local options = {}
    if opts then
	opts.noremap = true
	opts.silent = true
        options = vim.tbl_extend("force", options, opts)
    else
	options.noremap = true
	options.silent = true
    end
    vim.keymap.set(mode, input, "<nop>", options)
    vim.keymap.set(mode, input, out, options)
end
function Autocmd(name, actions, patt, comm)
    local api = vim.api
    api.nvim_create_augroup(name, { clear = true })
    api.nvim_create_autocmd(actions, { pattern = patt, command = comm, group = name })
end

Map("n", "<Space>", "<nop>")
vim.g.mapleader = " "
vim.opt.termguicolors = true

local indent_settings = {
    go = 8
}
function SetIndent()
    local default_indent = 4
    local filetype = vim.bo.filetype
    local indent = indent_settings[filetype]
    if not indent then
	indent = default_indent
    end
    vim.bo.shiftwidth = indent
    vim.bo.softtabstop = indent
    vim.bo.tabstop = indent
    vim.bo.expandtab = true
end
Autocmd("FileTypeIndent", "FileType", "*", "lua SetIndent()")

local lazypath = vim.fn.stdpath("data") .. "./lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{ import = "plugins" }, { import = "plugins.lsp" }, { import = "plugins.colours" }})
vim.cmd [[colorscheme github_dark_default]]
