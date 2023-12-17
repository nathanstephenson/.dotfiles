return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip"
    },
    config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local winHighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel"
	cmp.setup({
	    completion = {
		completeopt = "menu,menuone,preview,noselect"
	    },
	    snippet = {
		expand = function(args)
		    luasnip.lsp_expand(args.body)
		end
	    },
	    mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-g>"] = cmp.mapping.complete(),
		["<C-G>"] = cmp.mapping.abort(),
		["<cr>"] = cmp.mapping.confirm({ select = false }),
	    }),
	    sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP
		{ name = "luasnip" }, -- snippets
		--{ name = "buffer" }, -- text within the current buffer
		{ name = "path" }, -- file system paths
	    }),
	    window = {
		completion = cmp.config.window.bordered(winHighlight),
		documentation = cmp.config.window.bordered(winHighlight)
	    }
	})
    end
}
