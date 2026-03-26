local symbols_outline = {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				-- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				-- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		local telescope_picker = {
			extensions = {
				aerial = {
					-- Set the width of the first two columns (the second
					-- is relevant only when show_columns is set to 'both')
					col1_width = 4,
					col2_width = 30,
					-- How to format the symbols
					format_symbol = function(symbol_path, filetype)
						if filetype == "json" or filetype == "yaml" then
							return table.concat(symbol_path, ".")
						else
							return symbol_path[#symbol_path]
						end
					end,
					-- Available modes: symbols, lines, both
					show_columns = "both",
				},
			},
		}

		require("telescope").setup(telescope_picker)

		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>gs", "<cmd>Telescope aerial<CR>")
	end,
}

local plugins_search = {
	"polirritmico/telescope-lazy-plugins.nvim",
	keys = {
		{ "<leader>fp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins" },
	},
}

function search_keymaps()
	local builtin = require("telescope.builtin")

	local map = vim.keymap.set

	map("n", "<leader>ff", builtin.find_files, {}) -- main use
	map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>") -- find all files (include hidden)
	map("n", "<C-p>", builtin.git_files, {}) -- browse git files
	map("n", "<leader>vh", builtin.help_tags, {}) -- find in manual
	map("n", "<leader>fg", builtin.live_grep, {}) -- grep search
	map("n", "<leader>fb", builtin.buffers, {}) -- view buffers

	map("n", "<leader>fw", function()
		local word = vim.fn.expand("<cword>")
		builtin.grep_string({ search = word })
	end, { desc = "Telescope: Search current word, symbols excluded" })
end

local picker = {
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
	config = search_keymaps,
}

return {
	picker,
	plugins_search,
	symbols_outline,
}
