local mini = {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup() -- cool selection keymaps (V)

		require("mini.surround").setup() -- autopair brackets/quotes

		require("mini.operators").setup() -- cool text motions

		require("mini.notify").setup() -- notifications

		vim.keymap.set({ "n", "v" }, "<leader>nn", MiniNotify.show_history, { desc = "Show notifications history" })
		vim.keymap.set({ "n", "v" }, "<leader>nh", MiniNotify.clear, { desc = "Clear notifications" })

		require("mini.comment").setup() -- comment code

		-------------------
		-- File explorer --
		-------------------

		require("mini.files").setup({
			-- oil-like files
			windows = {
				preview = true,
				width_focus = 50,
				width_nofocus = 25,
				width_preview = 65,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>ef", MiniFiles.open, { desc = "Explore Files" })

		vim.keymap.set("n", "<leader>fc", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open mini.files (reveal current file)" })

		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local cur_target = MiniFiles.get_explorer_state().target_window
				local new_target = vim.api.nvim_win_call(cur_target, function()
					vim.cmd(direction .. " split")
					return vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target)

				-- This intentionally doesn't act on file under cursor in favor of
				-- explicit "go in" action (`l` / `L`). To immediately open file,
				-- add appropriate `MiniFiles.go_in()` call instead of this comment.
				MiniFiles.go_in()
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "<C-s>", "belowright horizontal")
				map_split(buf_id, "<C-v>", "belowright vertical")
				-- map_split(buf_id, "<C-t>", "tab")
			end,
		})

		-------------------

		require("mini.splitjoin").setup() -- `gS` to split or join lines
	end,
}

return mini
