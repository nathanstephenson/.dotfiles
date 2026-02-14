return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			term_colors = true,
			color_overrides = {
				all = {
					base = "#1a1a1a",
				},
			},
		})
	end,
}
