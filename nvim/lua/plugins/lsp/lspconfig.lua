return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Specify how the border looks like
		local border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		local keybinds = function(client, bufnr)
			local opts = { buffer = bufnr }

			opts.desc = "Show LSP references"
			Map("n", "gf", "<Cmd>Telescope lsp_references<cr>", opts)

			opts.desc = "Go to declaration"
			Map("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			Map("n", "gd", "<Cmd>Telescope lsp_definitions<cr>:noh<cr>", opts)

			opts.desc = "Show LSP implementations"
			Map("n", "<leader>gf", "<Cmd>Telescope lsp_implementations<cr>", opts)

			opts.desc = "Show type definitions"
			Map("n", "gt", "<Cmd>Telescope lsp_type_definitions<cr>", opts)

			opts.desc = "Show available code actions"
			Map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			Map("n", "<leader>q", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			Map("n", "gE", "<Cmd>Telescope diagnostics bufnr=nil<cr>", opts)

			opts.desc = "Show line diagnostics"
			vim.diagnostic.config({
				float = { border = border },
			})
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

		-- Add the border on hover and on signature help popup window
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
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
				},
			},
			handlers = handlers,
		})

		lspconfig["vimls"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["vtsls"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
			root_dir = function(fname)
				return lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json")(fname)
					or lspconfig.util.find_git_ancestor(fname)
			end,
		})

		lspconfig["biome"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["eslint"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["kotlin_language_server"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["templ"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			filetypes = { "html", "css", "templ", "javascriptreact", "typescriptreact" },
			init_options = {
				userLanguages = {
					html = "html",
					css = "css",
					templ = "html",
				},
			},
			handlers = handlers,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			filetypes = { "py", "python" },
			on_attach = keybinds,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
			handlers = handlers,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["gleam"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		lspconfig["omnisharp"].setup({
			cmd = {
				"dotnet",
				"/Users/nathanstephenson/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
			},
			--cmd = { "dotnet", "/Users/nathanstephenson/.config/omnisharp/OmniSharp.dll" },
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})
	end,
}
