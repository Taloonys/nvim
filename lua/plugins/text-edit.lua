local multi_cursor = {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "x" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<leader><up>", function()
			mc.lineSkipCursor(-1)
		end)
		set({ "n", "x" }, "<leader><down>", function()
			mc.lineSkipCursor(1)
		end)

		-- Add or skip adding a new cursor by matching word/selection
		set({ "n", "x" }, "<leader>n", function()
			mc.matchAddCursor(1)
		end)
		set({ "n", "x" }, "<leader>s", function()
			mc.matchSkipCursor(1)
		end)
		set({ "n", "x" }, "<leader>N", function()
			mc.matchAddCursor(-1)
		end)
		set({ "n", "x" }, "<leader>S", function()
			mc.matchSkipCursor(-1)
		end)

		-- Add and remove cursors with control + left click.
		set("n", "<c-leftmouse>", mc.handleMouse)
		set("n", "<c-leftdrag>", mc.handleMouseDrag)
		set("n", "<c-leftrelease>", mc.handleMouseRelease)

		-- Disable and enable cursors.
		set({ "n", "x" }, "<c-q>", mc.toggleCursor)

		-- Mappings defined in a keymap layer only apply when there are
		-- multiple cursors. This lets you have overlapping mappings.
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one.
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- Delete the main cursor.
			layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

			-- Enable and clear cursors using escape.
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}

local smart_substitution = {
	"cshuaimin/ssr.nvim",
	config = function()
		require("ssr").setup({
			border = "rounded",
			min_width = 50,
			min_height = 5,
			max_width = 120,
			max_height = 25,
			adjust_window = true,
			keymaps = {
				close = "q",
				next_match = "n",
				prev_match = "N",
				replace_confirm = "<cr>",
				replace_all = "<leader><cr>",
			},
		})
	end,
}
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
	require("ssr").open()
end)

local parser_based_refactor = {
	"nvim-treesitter/nvim-treesitter-refactor",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- just required to be installed
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			refactor = {
				highlight_definitions = {
					enable = true,
					-- Set to false if you have an `updatetime` of ~100.
					clear_on_cursor_move = true,
				},
			},
			smart_rename = {
				enable = true,
				-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
				keymaps = {
					smart_rename = "grr",
				},
			},
		})
	end,
}

local surround = {
	"kylechui/nvim-surround",
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}

local autopairs = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
}

local pretty_fold = {
	"anuvyklack/pretty-fold.nvim",
	config = function()
		require("pretty-fold").setup({})
	end,
}

local split_or_join_code = {
	"Wansmer/treesj",
	keys = { "<space>m", "<space>j", "<space>s" },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({--[[ your config ]]
		})
	end,
}

return {
	surround,
	autopairs,
	pretty_fold,
	parser_based_refactor,
	smart_substitution,
	multi_cursor,
	split_or_join_code,
}
