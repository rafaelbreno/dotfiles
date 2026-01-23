vim.lsp.config("hls", {
  cmd = {'haskell-language-server-wrapper', '--lsp'},
  capabilities = require("util").capabilities,
  on_attach = require("util").on_attach,
  settings = {
    haskell = {
      hlintOn = true,
      formatOnImportOn = true,
      diagnosticsOnChange = true,
      completionSnippetsOn = true,
      formattingProvider = 'stylish-haskell',
    },
  },
})
