-- ╔════════════════════╗
-- ║    Snippet load    ║
-- ╚════════════════════╝
-- >>> required by LuaSnip if friendly-snippets is used
-- `nvim-cmp` === `cmp`
require("luasnip.loaders.from_vscode").lazy_load()

-- ╔════════════════════════════╗
-- ║    Form lsp capabilites    ║
-- ╚════════════════════════════╝
-- >>> forward cmp capabilities for neovim completion to lsp's
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({ capabilites = capabilities })
lspconfig.pyright.setup({ capabilites = capabilities })
lspconfig.gopls.setup({ capabilites = capabilities })
lspconfig.cmake.setup({ capabilites = capabilities })
lspconfig.rust_analyzer.setup({ capabilites = capabilities }) -- could be replaced by rustaceanvim
lspconfig.dockerls.setup({ capabilites = capabilities })
lspconfig.jsonls.setup({
	capabilites = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
lspconfig.yamlls.setup({
	capabilites = capabilities,
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
lspconfig.eslint.setup({ capabilites = capabilities }) -- js, ts
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	init_options = {
		fallbackFlags = { "--std=c++17" }, --
	},
	capabilites = capabilities,
})

-- ╔══════════════════════════════╗
-- ║    Autocompletion sources    ║
-- ╚══════════════════════════════╝

-- sources for autocompletion
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- <CR> = Enter. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping.confirm({ select = true }), -- there is a plenty of pain with ai-completion wih <CR> and <Tab><Tab>
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(), -- Open completion list
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp completion
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "buffer" }, -- completion with words, that were used in current buffer
		{ name = "path" }, -- system paths
		{ name = "nvim_lsp_signature_help" }, -- show signature docs
		{ name = "treesitter" },
		{ name = "doxygen" },
		{ name = "conventionalcommits" },
	}),
})

-- command line autocompletion buff
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- ╔══════════════════════╗
-- ║    Better keymaps    ║
-- ╚══════════════════════╝
local map = vim.keymap.set
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go to declaration"
		map("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "Smart rename"
		map("n", "grn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		map("n", "gbd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostics"
		map("n", "gld", vim.diagnostic.open_float, opts)

		opts.desc = "Show documentation for what is under cursor"
		map("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		map("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
