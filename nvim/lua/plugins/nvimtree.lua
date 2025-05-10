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

		Map("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
	end,
}
