return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    pickers = { "git_files" },
    config = function()
        require("telescope")

        local setKeybinds = function(path)
            local ts = require("telescope.builtin")
            local opts = { cwd = path, path_display = { "truncate", "smart" } }
            local find = function() ts.find_files(opts) end
            vim.keymap.set("n", "<leader>ff", find, { noremap = true, })
            local grep = function() ts.live_grep(opts) end
            vim.keymap.set("n", "<leader>fg", grep, { noremap = true, })
            local grepStr = function() ts.grep_string(opts) end
            vim.keymap.set("n", "<leader>fh", grepStr, { noremap = true, })
            Map("n", "<leader>px", "<Cmd>SessionPurgeOrphaned<cr>")
        end
        vim.api.nvim_create_user_command("SetTelescopeKeybinds", function() GetProjectPath(setKeybinds) end, {})
        Autocmd("Telescope Keybinds",  { "BufWinEnter" }, { "*/", "*.*" }, "SetTelescopeKeybinds")

        Map("n", "<leader>fb", "<Cmd>Telescope buffers<cr>")
        Map("n", "<leader>fi", "<Cmd>Telescope help_tags<cr>")
    end,
}
