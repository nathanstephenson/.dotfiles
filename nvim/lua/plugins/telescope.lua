return { 
    "nvim-telescope/telescope.nvim",
    config = function()
	Map("n", "<leader>ff", "<Cmd>Telescope find_files<cr>")
	Map("n", "<leader>fg", "<Cmd>Telescope live_grep<cr>")
	Map("n", "<leader>fb", "<Cmd>Telescope buffers<cr>")
	Map("n", "<leader>fh", "<Cmd>Telescope help_tags<cr>")
    end
}
