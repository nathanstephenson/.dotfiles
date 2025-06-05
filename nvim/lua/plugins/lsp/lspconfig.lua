OldCwd = ""

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

		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("lua_ls", {
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

		vim.lsp.config("vimls", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("biome", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("kotlin_language_server", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("templ", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("tailwindcss", {
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

		vim.lsp.config("pyright", {
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

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("gleam", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		vim.lsp.config("omnisharp", {
			cmd = {
				"dotnet",
				"/Users/nathanstephenson/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
			},
			--cmd = { "dotnet", "/Users/nathanstephenson/.config/omnisharp/OmniSharp.dll" },
			capabilities = capabilities,
			on_attach = keybinds,
			handlers = handlers,
		})

		local allLsps = {
			"html",
			"lua_ls",
			"vimls",
			"cssls",
			"vtsls",
			"biome",
			"eslint",
			"kotlin_language_server",
			"gopls",
			"templ",
			"tailwindcss",
			"pyright",
			"rust_analyzer",
			"gleam",
			"clangd",
			"omnisharp",
		}

		local function disableAll()
			for _, v in ipairs(allLsps) do
				-- print("disabling language server:", v)
				vim.lsp.enable(v, false)
			end
		end
		local function enableAll()
			for _, v in ipairs(allLsps) do
				-- print("enabling language server:", v)
				vim.lsp.enable(v, true)
			end
		end

		local function updateLsp()
			local cwd = vim.fn.FindRootDirectory()
			if cwd == OldCwd then
				-- print("dir not changed, skipping")
				return
			end
			disableAll()

			local sp = Split(cwd, "/")
			local project = sp[#sp]

			-- print("starting project", project)

			if "pbp_api" == project then
				-- print("starting limited language servers for project: 'pbp_api'")
				vim.lsp.enable({ "vtsls", "html", "cssls", "biome" })
			elseif "platform" == project or "world" == project then
				-- print("starting limited language servers for project: 'platform'")
				vim.lsp.enable({ "vtsls", "html", "cssls", "eslint" })
			else
				-- print("no project found")
				enableAll()
			end
		end

		disableAll()
		vim.api.nvim_create_user_command("SetLsp", updateLsp, {})
		-- Autocmd("LspSetup", { "VimEnter", "BufEnter" }, {}, "SetLsp")
		Autocmd("LspUpdate", { "DirChangedPre" }, "auto", "SetLsp")
	end,
}
