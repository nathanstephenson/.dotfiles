return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            go = { "gofmt" },
            templ = { "gofmt" },
            lua = { "stylua" },
            javascript = { "biome", "prettier", stop_after_first = true },
            javascriptreact = { "biome", "prettier", stop_after_first = true },
            typescript = { "biome", "prettier", stop_after_first = true },
            typescriptreact = { "biome", "prettier", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "never",
        },
        notify_on_error = true,
        notify_no_formatters = true,
    },
}
