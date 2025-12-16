local mini = {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup() -- cool selection keymaps (V)
		require("mini.surround").setup() -- autopair brackets/quotes
		require("mini.operators").setup() -- cool text motions
	end,
}

return mini
