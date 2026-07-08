-- nvim/lua/lsp_config/ts.lua
local function check_ts_ls()
  if vim.fn.executable('typescript-language-server') == 1 then
    return true
  end
  vim.notify("typescript-language-server not found. Run: npm install -g typescript typescript-language-server", vim.log.levels.WARN)
  return false
end

if check_ts_ls() then
  vim.lsp.config("ts_ls", {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      },
    },
    on_attach = function(client, bufnr)
      require("util").on_attach(client, bufnr)
      vim.notify("ts_ls attached", vim.log.levels.DEBUG)
    end,
    capabilities = require("util").capabilities,
  })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply   = true,
    })
  end,
})
