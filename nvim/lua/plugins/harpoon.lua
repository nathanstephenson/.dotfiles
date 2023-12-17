return { 'ThePrimeagen/harpoon',
    config = function()
	Map("n", "<leader>ga", "<Cmd>lua require('harpoon.mark').add_file()<cr>")
	Map("n", "<leader>g1", "<Cmd>lua require('harpoon.mark').set_current_at(1)<cr>")
	Map("n", "<leader>g2", "<Cmd>lua require('harpoon.mark').set_current_at(2)<cr>")
	Map("n", "<leader>g3", "<Cmd>lua require('harpoon.mark').set_current_at(3)<cr>")
	Map("n", "<leader>g4", "<Cmd>lua require('harpoon.mark').set_current_at(4)<cr>")
	Map("n", "<leader>rr", "<Cmd>lua require('harpoon.mark').rm_file()<cr>")

	Map("n", "<leader>m", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
	Map("n", "<leader>1", "<Cmd>lua require('harpoon.ui').nav_file(1)<cr>")
	Map("n", "<leader>2", "<Cmd>lua require('harpoon.ui').nav_file(2)<cr>")
	Map("n", "<leader>3", "<Cmd>lua require('harpoon.ui').nav_file(3)<cr>")
	Map("n", "<leader>4", "<Cmd>lua require('harpoon.ui').nav_file(4)<cr>")
    end
}
