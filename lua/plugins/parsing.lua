local parsers = {
	"rust",
	"cpp",
	"javascript",
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	-- "doxygen",
	"xml",
}

local function SupportWix()
	-- Enable Tree-sitter highlighting when a parser is available.
	vim.api.nvim_create_autocmd("FileType", {
		pattern = parsers,
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

			if lang and pcall(vim.treesitter.language.inspect, lang) then
				vim.treesitter.start(args.buf, lang)
			end
		end,
	})

	--
	-- Enable XML parser for WXS/WXI/WXL files (WiX).
	--

	vim.filetype.add({
		extension = {
			wxs = "wxs",
			wxi = "wxi",
			wxl = "wxl",
		},
	})

	vim.treesitter.language.register("xml", "wxs")
	vim.treesitter.language.register("xml", "wxi")
	vim.treesitter.language.register("xml", "wxl")
end

local function TreesitterConfig()
	local treesitter = require("nvim-treesitter")

	treesitter.setup({
		-- Keep parser installation separate from Neovim's runtime.
		-- Change this only if you have a custom parser location.
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	-- Install missing parsers.
	-- New nvim-treesitter no longer has `ensure_installed` / `auto_install`
	-- in the old configs.setup() API.
	treesitter.install(parsers)

	-- SupportWix()
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = TreesitterConfig,
	},
}
