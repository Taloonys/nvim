function SetCoreColors(color)
	color = color or "flow"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })

	-- Fix colors for inactive windows (also for split & telescope)
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

SetCoreColors()
