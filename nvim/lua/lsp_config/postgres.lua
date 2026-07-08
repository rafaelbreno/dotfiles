local util = require('util')

vim.lsp.config('postgres_lsp', {
  cmd       = { 'postgres-language-server', 'lsp-proxy' },
  filetypes = { 'sql' },
  root_markers = { 'postgres-language-server.jsonc' },
  capabilities = util.capabilities,
  on_attach    = util.on_attach,
})
