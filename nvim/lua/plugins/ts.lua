return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"c", "query", "lua", "luadoc", "vimdoc", "vim", "go", "rust", "css", "typescript", "javascript", "kotlin"},
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true
            },
            autopairs = {
                enable = true
            },
            rainbow = {
                enable = true,
                extended_mode = true
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>gn",
                    node_incremental = "<leader>gn",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end
}
