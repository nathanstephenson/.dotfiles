return {
    'echasnovski/mini.comment',
    version = false,
    mappings = {
        comment = "gc",
        comment_line = "gcc",
        comment_visual = "gc",
        textobject = "gc",
    },
    init = function()
        require('mini.comment').setup()
    end,
}
