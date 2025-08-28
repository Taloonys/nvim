return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		require("ibl").setup({ enabled = false }) -- call is required
		vim.keymap.set("n", "<leader>iv", ":IBLToggle<CR>")
	end,
}
