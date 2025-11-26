require'lspconfig'.tsserver.setup{
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,
}
