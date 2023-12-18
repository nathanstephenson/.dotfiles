return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    setup = true,
    config = true,
    init =  function()
	local harpoon = require("harpoon")
	harpoon:setup()
	Map("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

	Map("n", "<leader>ga", function() harpoon:list():append() end)
	Map("n", "<leader>rr", function() harpoon:list():remove() end)
	Map("n", "<leader>ra", function() harpoon:list():clear() end)
	-- Map("n", "<leader>g1", function() harpoon:list():set_current_at(1) end)
	-- Map("n", "<leader>g2", function() harpoon:list():set_current_at(2) end)
	-- Map("n", "<leader>g3", function() harpoon:list():set_current_at(3) end)
	-- Map("n", "<leader>g4", function() harpoon:list():set_current_at(4) end)

	Map("n", "<leader>1", function() harpoon:list():select(1) end)
	Map("n", "<leader>2", function() harpoon:list():select(2) end)
	Map("n", "<leader>3", function() harpoon:list():select(3) end)
	Map("n", "<leader>4", function() harpoon:list():select(4) end)
    end,
}
