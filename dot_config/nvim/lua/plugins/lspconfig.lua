require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"lua_ls",
		"pyright",
		"texlab",
	},
})
require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			-- -- Function executed when the LSP server startup
			-- on_attach = function(client, bufnr)
			--	 local opts = { noremap=true, silent=true }
			--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			--	 vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
			-- end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		require("lspconfig")[server].setup(opt)
	end,
})
--[[
local lspconfig = require("lspconfig")
local cmd = { "clangd", "--query-driver=/Library/Developer/CommandLineTools/usr/bin/c++" }
lspconfig.clangd.setup({
	cmd = cmd,
})]]
--

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<Leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<Leader>dc", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
		-- { name = "cmdline" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-c>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:CmpNormal",
		},
	},
})
