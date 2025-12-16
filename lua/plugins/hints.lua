local scope_context = {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		vim.keymap.set("n", "<leader>cv", ":TSContext toggle<CR>")
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
		require("local-highlight").setup()
	end,
}

return {
	scope_context,
	colors_hints,
	highlight_word,
}
