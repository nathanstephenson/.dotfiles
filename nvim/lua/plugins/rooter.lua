return {
    'airblade/vim-rooter',
    setup = function()
	require("rooter")
        vim.g.rooter_patterns = { ".git", ".git/", ".gitignore" }
	vim.g.rooter_buftypes = {""}
	vim.fn.FindRootDirectory()
    end,
}
