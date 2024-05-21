return {
    "rmagatti/auto-session",
    dependencies = { "nvim-telescope/telescope.nvim", "airblade/vim-rooter" },
    config = function()
        local autosession = require("auto-session")
        autosession.setup({
            log_level = "error",
            auto_session_enable_last_session = false,
            cwd_change_handling = {
                restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
                pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
                post_cwd_changed_hook = nil,
            },
            session_lens = {
                theme_conf = {
                    border = true,
                    previewer = true,
                    previewer_horizontal = false,
                    prompt = true,
                    previewer_title = "Session Previews",
                    results_title = "Saved Sessions",
                    previewer_rich_mode = "horizontal",
                },
                load_on_setup = true,
            },
        })

        local setKeybinds = function()
	    local path = vim.fn.FindRootDirectory()
            local as = require("auto-session")
            vim.keymap.set("n", "<leader>pw", function() as.SaveSession(path, false) end, { noremap = true, })
            vim.keymap.set("n", "<leader>pd", function() as.DeleteSession(path) end, { noremap = true, })
            vim.keymap.set("n", "<leader>po", function() as.RestoreSession(path) end, { noremap = true, })
            Map("n", "<leader>px", "<Cmd>SessionPurgeOrphaned<cr>")
        end
        vim.api.nvim_create_user_command("SetAutosessionKeybinds", setKeybinds, {})
        Autocmd("AutoSession Keybinds",  { "BufWinEnter" }, { "*/", "*.*" }, "SetAutosessionKeybinds")

        require("telescope").load_extension("session-lens")
        local session = require("auto-session.session-lens")
        vim.keymap.set("n", "<leader>pp", session.search_session, { noremap = true, })
    end
}
