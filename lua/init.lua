function map(mode, input, out, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, input, out, options)
end

if vim.fn.has('nvim') == 1 then --only use plug if running from nvim (useful for using vim layer in IDEs)
	require('plug')
end
