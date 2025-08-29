-- ╔═══════════════╗
-- ║    Pencils    ║
-- ╚═══════════════╝

function SetCoreColors(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })

	-- Fix colors for inactive windows (also for split & telescope)
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

function FixTelescopeColors()
	-- Fix telescope borders colors
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
end

function FixNoiceColors()
	vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "none" })
	vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { bg = "none" })

	require("notify").setup({
		-- call :h notify.setup() to see defaults
		background_colour = "#000000", -- basicly to drop useless warning
		render = "minimal",
		top_down = false,
		fps = 60,
	})
end

-- ╔════════════════════╗
-- ║    Call Pencils    ║
-- ╚════════════════════╝

SetCoreColors()
FixTelescopeColors()
FixNoiceColors()
