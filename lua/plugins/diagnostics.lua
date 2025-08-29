local inline_diagnostic_message = {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach` / 'VeryLazy'
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup()
		vim.diagnostic.config({ virtual_text = false })
	end,
}

local code_actions = {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },

		-- optional picker via telescope
		{ "nvim-telescope/telescope.nvim" },
	},
	event = "LspAttach",
	opts = {},
	config = function()
		vim.keymap.set({ "n", "x" }, "<leader>ca", function()
			require("tiny-code-action").code_action()
		end, { noremap = true, silent = true })
	end,
}

return { inline_diagnostic_message, code_actions }
