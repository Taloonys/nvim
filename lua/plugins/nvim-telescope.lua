function config()
	local builtin = require("telescope.builtin")

	local map = vim.keymap.set

	map("n", "<leader>pf", builtin.find_files, {}) -- main use
	map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>") -- find all files (include hidden)

	map("n", "<C-p>", builtin.git_files, {}) -- browse git files

	map("n", "<leader>ps", function() -- Can find <input> inside project files
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)

	map("n", "<leader>vh", builtin.help_tags, {}) -- find in manual

	-- Buffers overview
	map("n", "<leader>fg", builtin.live_grep, {})
	map("n", "<leader>fb", builtin.buffers, {}) -- view buffers
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"polirritmico/telescope-lazy-plugins.nvim",
			keys = {
				{ "<leader>cp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins" },
			},
		},
	},
	opts = {
		extensions = {
			---@module "telescope._extensions.lazy_plugins"
			---@type TelescopeLazyPluginsUserConfig
			lazy_plugins = {
				lazy_config = vim.fn.stdpath("config") .. "/lua/lazy/init.lua", -- Must be a valid path to the file containing the lazy spec and setup() call.
			},
		},
		-- etc.
	},
	config = config,
}
