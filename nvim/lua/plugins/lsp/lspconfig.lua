local oldCwd

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

		for _, v in ipairs(AllLsps) do
			local opts = {
				capabilities = capabilities,
				on_attach = keybinds,
				handlers = handlers,
				autostart = false,
			}
			if "lua_ls" == v then
				opts = Merge(opts, {
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
				})
			elseif "tailwindcss" == v then
				opts = Merge(opts, {
					filetypes = { "html", "css", "templ", "javascriptreact", "typescriptreact" },
					init_options = {
						userLanguages = {
							html = "html",
							css = "css",
							templ = "html",
						},
					},
				})
			elseif "pyright" == v then
				opts = Merge(opts, {
					filetypes = { "py", "python" },
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "off",
							},
						},
					},
				})
			end
			vim.lsp.config(v, opts)
		end

		local function updateLsp()
			local cwd = vim.fn.FindRootDirectory()
			if cwd == oldCwd then
				-- print("dir not changed, skipping")
				return
			end
			vim.lsp.enable(AllLsps, false)

			local sp = Split(cwd, "/")
			local project = sp[#sp]

			-- print("starting project", project)

			if "pbp-api" == project then
				-- print("starting limited language servers for project: 'pbp-api'")
				vim.lsp.enable({ "vtsls", "html", "cssls", "biome" })
			elseif "platform" == project or "world" == project then
				-- print("starting limited language servers for project: 'platform'")
				vim.lsp.enable({ "vtsls", "html", "cssls", "eslint" })
			else
				-- print("no project found")
				vim.lsp.enable(AllLsps, true)
			end
		end

		-- vim.lsp.enable(AllLsps, false)
		vim.api.nvim_create_user_command("SetLsp", updateLsp, {})
		-- Autocmd("LspSetup", { "VimEnter" }, {}, "SetLsp")
		Autocmd("LspUpdate", { "DirChangedPre" }, "auto", "SetLsp")
	end,
}
