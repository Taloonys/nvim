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

		require("mini.files").setup({
			windows = {
				preview = true,
				width_focus = 50,
				width_nofocus = 25,
				width_preview = 65,
			},
		}) -- oil-like files
		vim.keymap.set({ "n", "v" }, "<leader>ef", MiniFiles.open, { desc = "Explore Files" })
	end,
}

return mini
