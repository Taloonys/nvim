local docs_comments = {
	"danymat/neogen",
	-- config = true, -- default
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip" })
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>nf", ":Neogen<CR>", opts)
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}

local fold_comments = {
	"soemre/commentless.nvim",
	cmd = "Commentless",
	keys = {
		{
			"<leader>/",
			function()
				require("commentless").toggle()
			end,
			desc = "Toggle Comments",
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- Customize Configuration
	},
}

-- vim.opt.foldminlines = 0 -- Allow folding/hiding single lines
-- vim.opt.fillchars = "fold: " -- Remove the trailing dots but it will spawn `~` in empty strings

return { docs_comments, fold_comments }
