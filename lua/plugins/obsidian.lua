return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	cmd = {
		"ObsidianOpen",
		"ObsidianQuickSwitch",
		"ObsidianNew",
		"ObsidianSearch",
		"ObsidianToday",
		"ObsidianBacklinks",
		"ObsidianFollowLink",
	},
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		-- "BufReadPre path/to/my-vault/*.md",
		-- "BufNewFile path/to/my-vault/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = { workspaces = {} },
	config = function(_, opts)
		require("obsidian").setup(opts)

		-- if directory contains .obsidian/ -> launch plugin for it
		local cwd = vim.fn.getcwd()
		if vim.fn.isdirectory(cwd .. "/.obsidian") == 1 then
			require("obsidian").setup({
				workspaces = { { name = "auto", path = cwd } },
			})
		end

		vim.api.nvim_create_user_command("ObsidianOpenVault", function(args)
			local vault_path = args.args ~= "" and args.args or vim.fn.input("Vault path: ", vim.fn.getcwd(), "dir")
			if vim.fn.isdirectory(vault_path) == 0 then
				vim.notify("❌ Directory doesn't exist: " .. vault_path, vim.log.levels.ERROR)
				return
			end

			require("obsidian").setup({
				workspaces = {
					{ name = "manual", path = vault_path },
				},
			})

			vim.notify("✅ Obsidian workspace initialized: " .. vault_path, vim.log.levels.INFO)
		end, { nargs = "?", desc = "Manually open Obsidian vault" })
	end,
}
