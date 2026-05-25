local util = require('util')

vim.lsp.config("zls", {
  cmd       = { 'zls' },
  filetypes = { 'zig', 'zir', 'zon' },
  root_dir  = function(bufnr)
    return vim.fs.root(bufnr, { 'build.zig', 'build.zig.zon', '.git' })
      or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  end,
  capabilities = util.capabilities,
  on_attach    = util.on_attach,
  settings = {
    zls = {
      enable_snippets                                   = true,
      enable_ast_check_diagnostics                      = true,
      enable_import_embedfile_argument_completions      = true,
      semantic_tokens                                   = "full",
      enable_inlay_hints                                = true,
      inlay_hints_show_builtin                          = true,
      inlay_hints_exclude_single_argument               = true,
      inlay_hints_hide_redundant_param_names            = false,
      inlay_hints_hide_redundant_param_names_last_token = false,
      operator_completions                              = true,
      warn_style                                        = true,
      highlight_global_var_declarations                 = false,
      skip_std_references                               = false,
    }
  },
})

-- vim.lsp.enable() silently fails to auto-start ZLS on FileType.
-- This autocommand replicates what enable() should do, reliably.
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "zig", "zir" },
  callback = function(args)
    vim.lsp.start(vim.lsp.config["zls"])
  end,
})
