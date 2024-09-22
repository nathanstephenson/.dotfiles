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

---@param command string
---@return string|nil
function GetCommandOutput(command)
    local handle = io.popen(command)
    if handle == nil then
        return nil
    end
    local result = handle:read("*a")
    handle:close()
    return result
end

Map("n", "<Space>", "<nop>")
vim.g.mapleader = " "
vim.opt.termguicolors = true

local indent_settings = {
    go = 8,
    templ = 8,
    yaml = 2,
    gleam = 2
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
vim.cmd [[colorscheme catppuccin]]
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#747990', bold=false })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#C7D1F0', bold=false })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#747990', bold=false })

vim.filetype.add({
    extension = {
        templ = "templ"
    },
})
