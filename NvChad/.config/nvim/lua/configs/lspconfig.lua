require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  golangci_lint_ls = {},
  gopls = {},
  goimports = {},
  marksman = {},
  lua_language_server = {},
  ast_grep = {},
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end

-- read :h vim.lsp.config for changing options of lsp servers 
