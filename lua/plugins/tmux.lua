return {
	"aserowy/tmux.nvim",
	config = function()
		return require("tmux").setup()
		-- tmux also requires compitability lines -> https://github.com/aserowy/tmux.nvim
	end,
}
