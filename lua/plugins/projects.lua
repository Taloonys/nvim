-- this one is basicly for only cwd deduction, cuz mini.files doesn't change it by anymeans

local plugin = {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})

		require("telescope").load_extension("projects")
	end,
}

return plugin
