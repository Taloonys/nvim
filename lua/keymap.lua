-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝

-- btw `Mapleader` is not an error, but it wouldn't work...
vim.g.mapleader = " " -- <leader> is now whitespace

-- System buffer
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = " selected" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = " whole line" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { desc = " selected" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D', { desc = " whole line" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = " after cursor (Somehow it's slow*)" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = " before cursor" })

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "drag selected text 1 line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "drag selected text 1 line down" })

vim.keymap.set("v", "<", "<gv", { desc = "drag 1 tab left (and don't lose selection!)" })
vim.keymap.set("v", ">", ">gv", { desc = "drag 1 tab right (and don't lose selection!)" })

-- Basic stuff enchancements
vim.keymap.set("n", "J", "mzJ`z", { desc = "concatenate lines, BUT keeps cursor position" })

-- replaced by neoscroll
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")    -- scroll down AND center cursor pos on screen
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")    -- scroll up AND center cursor pos on screen
-- vim.keymap.set("n", "n", "nzzzv")          -- find next occurence AND center cursor + open fold
-- vim.keymap.set("n", "N", "Nzzzv")          -- find previous occurence AND center cursor + open fold

-- Misellaneous
vim.keymap.set(
	"n",
	"<space><space>x",
	"<cmd>source %<CR>",
	{ desc = "sync new changes in config with current session" }
)

-- Better text substitution
vim.keymap.set(
	"n",
	"<leader>rn",
	[[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]],
	{ desc = "Rename whole word under cursor (with confirmation)" }
)
vim.keymap.set(
	"n",
	"<leader>rN",
	[[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
	{ desc = "Rename whole word FAST without confirmation" }
)

vim.keymap.set(
	"v",
	"<leader>rn",
	[["hy:%s/<C-r>h//gc<Left><Left>]],
	{ desc = "Rename selected text (with confirmation)" }
)
vim.keymap.set(
	"v",
	"<leader>rN",
	[["hy:%s/<C-r>h//g<Left><Left>]],
	{ desc = "Rename selected text FAST without confirmation" }
)
