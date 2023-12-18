return {
    "sbdchd/neoformat",
    config = function()
	vim.g.neoformat_try_node_exe = 1
	Autocmd("NeofmtOnSave", { "BufWritePre", "InsertLeave" }, { "*.js", "*.ts", "*.tsx" }, "Neoformat prettier")
    end
}
