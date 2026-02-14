return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			dim_inactive_windows = true,
			styles = {
				transparency = true,
			},
		})
	end,
}
