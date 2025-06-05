return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			view = {
				width = 60,
			},
		})

		local api = require("nvim-tree.api")
		Map("n", "<leader>t", function()
			api.tree.toggle({ path = vim.fn.FindRootDirectory(), update_root = false, find_file = true })
		end, { desc = "Toggle NvimTree" })
	end,
}
