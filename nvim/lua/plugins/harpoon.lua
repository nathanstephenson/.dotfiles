return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    setup = true,
    config = true,
    init =  function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                key = vim.fn.FindRootDirectory
            },
            default = {
                get_root_dir = vim.fn.FindRootDirectory,
                select = function(list_item, list, option)
                    local root = vim.fn.FindRootDirectory()
                    print ("Opening " .. root .. "/" .. list_item.value)
                    vim.cmd("e " .. root .. "/" .. list_item.value)
                end
            }
        })
        --local conf = require("telescope.config").values
        --local function toggle_telescope(harpoon_files)
        --    local file_paths = {}
        --    for _, item in ipairs(harpoon_files.items) do
        --        table.insert(file_paths, item.value)
        --    end

        --    require("telescope.pickers").new({}, {
        --        prompt_title = "Harpoon",
        --        finder = require("telescope.finders").new_table({
        --            results = file_paths,
        --        }),
        --        previewer = conf.file_previewer({}),
        --        sorter = conf.generic_sorter({}),
        --    }):find()
        --end

        Map("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        Map("n", "<leader>ga", function() harpoon:list():add() end)
        Map("n", "<leader>gr", function() harpoon:list():remove() end)
        Map("n", "<leader>ra", function() harpoon:list():clear() end)

        Map("n", "<leader>1", function() harpoon:list():select(1) end)
        Map("n", "<leader>2", function() harpoon:list():select(2) end)
        Map("n", "<leader>3", function() harpoon:list():select(3) end)
        Map("n", "<leader>4", function() harpoon:list():select(4) end)
        Map("n", "<leader>5", function() harpoon:list():select(5) end)
        Map("n", "<leader>6", function() harpoon:list():select(6) end)
        Map("n", "<leader>7", function() harpoon:list():select(7) end)
        Map("n", "<leader>8", function() harpoon:list():select(8) end)
        Map("n", "<leader>9", function() harpoon:list():select(9) end)
    end,
}
