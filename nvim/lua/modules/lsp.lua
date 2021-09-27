require'lspconfig'.gopls.setup{
  cmd = {"gopls", "serve"},
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
