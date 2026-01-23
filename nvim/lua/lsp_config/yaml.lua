vim.lsp.config("yamlls", {
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,
})
