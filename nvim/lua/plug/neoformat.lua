autocmd("NeofmtOnSave", { "BufWritePre", "InsertLeave" }, "*.js*", "Neoformat")
autocmd("NeofmtOnSave", { "BufWritePre", "InsertLeave" }, "*.ts*", "Neoformat")
