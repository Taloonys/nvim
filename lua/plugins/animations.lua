local scrolling = {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({
			easing = "quadratic", -- quadratic / circular / sine
			respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" }, -- only default mappings
		})
	end,
}

local cursor = {
	"sphamba/smear-cursor.nvim",
	opts = {
		stiffness = 0.8,
		trailing_stiffness = 0.6,
		stiffness_insert_mode = 0.7,
		trailing_stiffness_insert_mode = 0.7,
		damping = 0.95,
		damping_insert_mode = 0.95,
		distance_stop_animating = 0.5,
		legacy_computing_symbols_support = true,
		time_interval = 7, -- ms
	},
}

return { scrolling, cursor }
