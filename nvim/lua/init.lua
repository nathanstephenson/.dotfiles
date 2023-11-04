local api = vim.api

function map(mode, input, out, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    api.nvim_set_keymap(mode, input, out, options)
end

function autocmd(name, actions, patt, comm)
	api.nvim_create_augroup(name, { clear = true })
	api.nvim_create_autocmd(actions, { pattern = patt, command = comm, group = name })
end

require('plug')
