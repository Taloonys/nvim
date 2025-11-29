vim.keymap.set(
	{ "n", "t" },
	"<leader>ldr",
	"<Cmd>lua require('lazydocker').toggle({ engine = 'docker' })<CR>",
	{ desc = "LazyDocker (docker)" }
)

-- vim.keymap.set(
--   { 'n', 't' },
--   '<leader>lp',
--   "<Cmd>lua require('lazydocker').toggle({ engine = 'podman' })<CR>",
--   { desc = 'LazyDocker (podman)' }
-- )

return {
	"crnvl96/lazydocker.nvim",
	config = function()
		require("lazydocker").setup({
			window = {
				settings = {
					width = 0.85, -- Percentage of screen width (0 to 1)
					height = 0.85, -- Percentage of screen height (0 to 1)
					border = "rounded", -- See ':h nvim_open_win' border options
					relative = "editor", -- See ':h nvim_open_win' relative options
				},
			},
		})
	end,
}
