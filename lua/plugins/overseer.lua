vim.keymap.set("n", "<leader>jr", ":OverseerRun<CR>")
vim.keymap.set("n", "<leader>jv", ":OverseerToggle<CR>")

return {
	"stevearc/overseer.nvim",
	config = function()
		require("overseer").setup()
	end,
}
