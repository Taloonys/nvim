local mini = {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup() -- cool selection keymaps (V)
		require("mini.surround").setup() -- autopair brackets/quotes
		require("mini.operators").setup() -- cool text motions
		require("mini.notify").setup() -- notifications
		require("mini.comment").setup() -- comment code

		vim.keymap.set({ "n", "v" }, "<leader>nn", MiniNotify.show_history, { desc = "Show notifications history" })
		vim.keymap.set({ "n", "v" }, "<leader>nh", MiniNotify.clear, { desc = "Clear notifications" })
	end,
}

return mini
