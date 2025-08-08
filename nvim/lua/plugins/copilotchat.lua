return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		config = function()
			local chat = require("CopilotChat")

			vim.g.copilot_no_tab_map = true
			vim.keymap.set("n", "<leader>tc", ":CopilotChatToggle<cr>")

			chat.setup({
				-- See Configuration section for options
				model = "claude-3.7-sonnet",
				temperature = 0.7,
				window = {
					title = "Copilot Chat",
					width = 80,
					layout = "vertical",
				},
				auto_insert_mode = true,
			})
		end,
	},
}
