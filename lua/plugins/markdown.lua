local md_preview = {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	-- you have to install yarn manually
	-- windows => winget install -e --id Yarn.Yarn
	-- if prebuild is not found => call manually in nvim `:call mkdp#util#install()`
	-- TODO: mdeval.nvim or sniprun.nvim
	build = function()
		if vim.fn.executable("yarn") == 1 then
			vim.fn["mkdp#util#install"]()
		else
			vim.notify("⚠️ Please install 'yarn' or 'npm' to build markdown-preview.nvim", vim.log.levels.WARN)
		end
	end,
	config = function()
		-- MarkDown View
		vim.keymap.set("n", "<leader>mdv", ":MarkdownPreview<CR>")
	end,
}

local md_table = {
	"Kicamon/markdown-table-mode.nvim",
	config = function()
		require("markdown-table-mode").setup()
		-- call `:Mtm` to ensert this mode, it will attempt to trigget lines with `|`
	end,
}

return { md_preview, md_table }
