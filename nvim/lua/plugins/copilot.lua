return {
	"github/copilot.vim",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
	end,
}
