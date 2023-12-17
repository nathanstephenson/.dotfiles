return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    setup = {
	icons_enabled = true,
	theme = "auto",
	refresh = {
	    statusline = 500,
	    winbar = 500,
	    tabline = 500
	}
    }
}
