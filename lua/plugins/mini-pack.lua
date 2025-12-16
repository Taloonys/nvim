local mini = {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.operators").setup()
	end,
}

return mini
