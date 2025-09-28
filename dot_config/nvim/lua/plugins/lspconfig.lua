require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "texlab",
    "clangd",
    "bashls",
  },
})
-- ~/.config/nvim/lua/plugins/lspconfig.lua

-- 1) common on_attach / capabilities
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  -- hover
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ timeout_ms = 1000 })
    end,
  })
end

vim.lsp.config('matlab_ls', {
  settings = {
    MATLAB = {
      installPath = "/Applications/MATLAB_R2025a.app", -- ←必ず設定する
      indexWorkspace = true,
      matlabConnectionTiming = "onStart",
      telemetry = false,
    },
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 2) mason + mason-lspconfig setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- put here the servers you want Mason to install for you
    "lua_ls",
    "pyright",
    "ts_ls",
  },
  -- servers installed via Mason will be enabled automatically
  automatic_enable = true,
})

-- 3) Explicitly configure each LSP with lspconfig
local servers = { "lua_ls", "pyright", "ts_ls" }
for _, srv in ipairs(servers) do
  vim.lsp.config(srv, {
    on_attach = on_attach,
    capabilities = capabilities,
    -- …any other server-specific settings…
  })
end
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
