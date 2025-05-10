return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	mason.setup({
	    ensure_installed = {
            --formatter
	    }
	})

	mason_lspconfig.setup({
	    ensure_installed = {
            "vtsls",
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
            "eslint",
	    },
	    automatic_installation = true
	})
    end
}
