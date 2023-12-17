return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
	"hrsh7th/cmp-nvim-lsp",
	{ "antosha417/nvim-lsp-file-operations", config = true }
    },
    config = function()
	    local lspconfig = require("lspconfig")
	    local cmp_nvim_lsp = require("cmp_nvim_lsp")
	    local keybinds = function(client, bufnr)
		local opts = { buffer = bufnr }

		opts.desc = "Show LSP references"
		Map("n", "gf", "<Cmd>Telescope lsp_references<cr>", opts)

		opts.desc = "Go to declaration"
		Map("n", "gd", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		Map("n", "gD", "<Cmd>Telescope lsp_definitions<cr>:noh<cr>", opts)

		opts.desc = "Show LSP implementations"
		Map("n", "<leader>gf", "<Cmd>Telescope lsp_implementations<cr>", opts)

		opts.desc = "Show type definitions"
		Map("n", "gt", "<Cmd>Telescope lsp_type_definitions<cr>", opts)

		opts.desc = "Show available code actions"
		Map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		Map("n", "<leader>q", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		Map("n", "gE", "<Cmd>Telescope diagnostics bufnr=0<cr>", opts)

		opts.desc = "Show line diagnostics"
		Map("n", "ge", vim.diagnostic.open_float, opts)

		opts.desc = "Go to previous diagnostic"
		Map("n", "[e", vim.diagnostic.goto_prev, opts)

		opts.desc = "Go to next diagnostic"
		Map("n", "]e", vim.diagnostic.goto_next, opts)

		opts.desc = "Show documentation"
		Map("n", "gh", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		Map("n", "<leader>rs", ":LspRestart<cr>", opts)
	    end

	    local capabilities = cmp_nvim_lsp.default_capabilities()

	    lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
	    })

	    lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
		settings = {
		    Lua = {
			diagnostics = {
			    globals = { "vim" },
			},
			workspace = {
			    library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			    },
			},
		    }
		}
	    })

	    lspconfig["vimls"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
	    })

	    lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
	    })

	    lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
	    })

	    lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" }
	    })

	    lspconfig["kotlin_language_server"].setup({
		capabilities = capabilities,
		on_attach = keybinds,
	    })
	end
}
