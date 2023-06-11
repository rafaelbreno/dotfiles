local util = require('lspconfig.util')

require'lspconfig'.zls.setup{
  cmd = {'zls'},
  filetypes = {'zig', 'zir'},
  root_dir = util.root_pattern('package.json', '.git'),
  capabilities = util.capabilities,
  on_attach = util.on_attach,
  settings = {
    zls = {
      enable_snippets = true,
      enable_ast_check_diagnostics = true,
      enable_autofix = true,
      enable_import_embedfile_argument_completions = true,
      semantic_tokens = ".full",
      enable_inlay_hints = true,
      inlay_hints_show_builtin = true,
      inlay_hints_exclude_single_argument = true,
      inlay_hints_hide_redundant_param_names = false,
      inlay_hints_hide_redundant_param_names_last_token = false,
      operator_completions = true,
      warn_style = true,
      highlight_global_var_declarations = true,
      dangerous_comptime_experiments_do_not_enable = true,
      include_at_in_builtins = true,
      skip_std_references = false,
      max_detail_length = 1048576,
      prefer_ast_check_as_child_process = true,
      record_session = false,
    }
  }
}
