local snacks = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		dim = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		zen = { enabled = true },
	},
	keys = {
		{
			"<leader>zen",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
	config = function()
		Snacks.indent.enable()
	end,
}

return snacks
