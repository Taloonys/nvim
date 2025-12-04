local oil_buffer_like_ex = {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = false,
			win_options = {
				-- without it telescope and other stuff would work with ~ instead of {cwd}
				winbar = "%{v:lua.require('oil').get_current_dir()}",
				signcolumn = "yes:2",
			},
			float = {
				max_width = 0.7,
				max_height = 0.7,
				border = "rounded",
			},
		})
	end,
	lazy = false,
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set({ "n", "v" }, "<leader>eo", "<CMD>Oil --float<CR>", { desc = "Open parent directory as float" })

-- plugin
local nvim_tree_ex = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function() -- UI & behaviour only
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}

vim.keymap.set({ "n", "v" }, "<leader>ef", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

return { nvim_tree_ex, oil_buffer_like_ex }
