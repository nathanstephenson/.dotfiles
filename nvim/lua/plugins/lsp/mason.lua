return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ensure_installed = {
				--formatter
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"vtsls",
                "tsgo",
				"html",
				"cssls",
				"emmet_ls",
				"rust_analyzer",
				"kotlin_language_server",
				"vimls",
				"lua_ls",
				"gopls",
				"templ",
				"tailwindcss",
				"pyright",
				"rust_analyzer",
			},
			automatic_installation = true,
			automatic_enable = false,
		})
	end,
}
