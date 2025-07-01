return {
	"airblade/vim-rooter",
	config = function()
		vim.g.rooter_patterns = { ".git", ".git/", ".gitignore" }
		vim.g.rooter_buftypes = { "" }
		vim.g.rooter_manual_only = 1
	end,
}
