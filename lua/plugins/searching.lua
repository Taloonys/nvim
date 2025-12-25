function keymaps()
	local builtin = require("telescope.builtin")

	local map = vim.keymap.set

	map("n", "<leader>ff", builtin.find_files, {}) -- main use
	map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>") -- find all files (include hidden)

	map("n", "<C-p>", builtin.git_files, {}) -- browse git files

	map("n", "<leader>gs", function() -- Can find <input> inside project files
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)

	map("n", "<leader>vh", builtin.help_tags, {}) -- find in manual

	-- Buffers overview
	map("n", "<leader>fg", builtin.live_grep, {})
	map("n", "<leader>fb", builtin.buffers, {}) -- view buffers

	map("n", "<leader>lds", builtin.lsp_dynamic_workspace_symbols, {})
	map("n", "<leader>lws", builtin.lsp_workspace_symbols, {})
end

local plugins_search = {
	"polirritmico/telescope-lazy-plugins.nvim",
	keys = {
		{ "<leader>fp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins" },
	},
}

local fzf_search_preview = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		plugins_search,
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
	config = keymaps,
}

return { fzf_search_preview, plugins_search }
