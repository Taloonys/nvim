return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	oprs = {
		-- keymaps
		vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle <CR>"),
		vim.keymap.set("n", "<leader>R", ':lua require("nvim-tree.api").tree.change_root_to_node()<CR>'),
	},
}
