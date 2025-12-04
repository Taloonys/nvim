local scope_context = {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		vim.keymap.set("n", "<leader>cv", ":TSContext toggle<CR>")
	end,
}

local indent_blankline = {
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

local colors_hints = {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup() -- required call!!
		vim.keymap.set("n", "<leader>clr", ":ColorizerToggle<CR>")
	end,
}

local highlight_word = {
	"tzachar/local-highlight.nvim",
	config = function()
		require("local-highlight").setup({
			animate = {
				enabled = false, -- only supports animation if snacks.nvim is installed
			},
		})
	end,
}

return {
	scope_context,
	indent_blankline,
	colors_hints,
	highlight_word,
}
