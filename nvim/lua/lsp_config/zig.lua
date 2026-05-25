local util = require('lspconfig.util')
local myUtil = require('util')

vim.lsp.config("zls", {
  cmd = {'zls'},
  filetypes = {'zig', 'zir', 'zon'},
  root_dir = util.root_pattern('build.zig', '.git'),
  capabilities = myUtil.capabilities,
  on_attach = myUtil.on_attach,
  settings = {
    zls = {
      enable_snippets = true,
      enable_ast_check_diagnostics = true,
      enable_import_embedfile_argument_completions = true,
      semantic_tokens = ".full",
      enable_inlay_hints = true,
      inlay_hints_show_builtin = true,
      inlay_hints_exclude_single_argument = true,
      inlay_hints_hide_redundant_param_names = false,
      operator_completions = true,
      warn_style = true,
      highlight_global_var_declarations = false,
      skip_std_references = false,
    }
  }
})
