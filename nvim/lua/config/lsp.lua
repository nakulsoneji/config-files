require("mason").setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "lua_ls", "html", "taplo", "cssls", "tsserver", "clangd", "jsonls" }
})

local lsp = require('lsp-zero').preset({
  name = "recommended",
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

vim.keymap.set('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN
    }
  },
  severity_sort = true,
  --[[float = {
    source = "if_many",
    focusable = "false"
  }]]--
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

