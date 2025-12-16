local cmp_doxygen = {
	"paopaol/cmp-doxygen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				require("nvim-treesitter.configs").setup({
					textobjects = {
						-- we need it for mini.ai only work with visual stuff
						enable = false,
					},
				})
			end,
		},
	},
}

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"ray-x/cmp-treesitter",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"davidsierradz/cmp-conventionalcommits",
		cmp_doxygen,
	},
}
