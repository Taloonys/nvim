return {
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
