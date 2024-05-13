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

---@param path string
---@return string|nil
function GetFirstGitignore(path)
    local gitignore = GetCommandOutput("[ -f " .. path .. "/.gitignore ] && echo 'truecontainsgitignore' || echo 'falsedoesntcontaingitignore'")
    if gitignore == nil then
        return nil
    end
    if string.find(gitignore, "falsedoesntcontaingitignore") then
        local newPath = path .. "/.."
        return GetFirstGitignore(newPath)
    end
    local gitPath = GetCommandOutput("git rev-parse --show-toplevel")
    if gitPath == nil then
        gitPath = ""
    end
    local realPath = GetCommandOutput("realpath " .. path)
    if realPath ~= nil and string.len(gitPath) < string.len(realPath) then
        gitPath = realPath
    end
    return gitPath
end

---@param callback function(string)
function GetProjectPath(callback)
    local gitPath = GetFirstGitignore(vim.fn.getcwd())
    local updatePathFn = function(path)
        if path == 0 or path == nil then
            path = vim.fn.getcwd()
        else
            path = string.gsub(path, "%s+", "")
        end
        if callback then
            callback(path)
        end
    end
    vim.schedule(function() updatePathFn(gitPath) end)
end
GetProjectPath(function(path) print(path) end)

Map("n", "<Space>", "<nop>")
vim.g.mapleader = " "
vim.opt.termguicolors = true

local indent_settings = {
    go = 8,
    templ = 8,
    yaml = 2
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

vim.filetype.add({
    extension = {
        templ = "templ"
    },
})
