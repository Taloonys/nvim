local mini = {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup() -- cool selection keymaps (V)

		require("mini.surround").setup() -- autopair brackets/quotes

		require("mini.operators").setup() -- cool text motions

		require("mini.notify").setup() -- notifications

		vim.keymap.set({ "n", "v" }, "<leader>nn", MiniNotify.show_history, { desc = "Show notifications history" })
		vim.keymap.set({ "n", "v" }, "<leader>nh", MiniNotify.clear, { desc = "Clear notifications" })

		require("mini.comment").setup() -- comment code

		-------------------
		-- File explorer --
		-------------------

		require("mini.files").setup({
			-- oil-like files
			windows = {
				preview = true,
				width_focus = 60,
				width_nofocus = 35,
				width_preview = 70,
			},
			options = { use_as_default_explorer = false },
		})
		vim.keymap.set({ "n", "v" }, "<leader>gef", MiniFiles.open, { desc = "Explore Buffer-like Files" })

		vim.keymap.set("n", "<leader>gfc", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open mini.files (reveal current file)" })

		-------------------

		require("mini.splitjoin").setup() -- `gS` to split or join lines
	end,
}

return mini
