local util = require('util')

vim.lsp.config("postgres", {
  cmd       = { 'postgres-language-server', '--stdio' },
  filetypes = { 'sql' },
  root_dir  = function(bufnr)
    return vim.fs.root(bufnr, { '.git' })
      or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  end,
  capabilities = util.capabilities,
  on_attach    = util.on_attach,
})
