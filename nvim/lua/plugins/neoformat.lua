return {
    "sbdchd/neoformat",
    config = function()
	vim.g.neoformat_try_node_exe = 1
	Autocmd("NeofmtOnSave JS", { "BufWritePre", "InsertLeave" }, { "*.js", "*.ts", "*.tsx" }, "Neoformat prettier")
	Autocmd("NeofmtOnSave Go", { "BufWritePre", "InsertLeave" }, { "*.go" }, "Neoformat gofmt")
    end
}
