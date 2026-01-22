local nvim_lsp = require('lspconfig')
local util = require('lspconfig.util')

-- Zig
require('lsp_config/zig');

-- Golang
require('lsp_config/go');

-- OCaml
require('lsp_config/ocaml');

-- Python
require('lsp_config/python');

-- Haskell
require('lsp_config/haskell');

-- Lua
require('lsp_config/lua');

-- Rust
require('lsp_config/rust');

-- Yaml
require('lsp_config/yaml');

-- Roslyn
require('lsp_config/roslyn');

nvim_lsp.svelte.setup{
  cmd = {'svelteserver', '--stdio'},
  filetypes = {'svelte'},
  root_dir = util.root_pattern('package.json', '.git'),
  capabilities = require("util").capabilities,
  on_attach = require("util").on_attach,
  -- default values
  --settings = {
     --= {
    --},
  --},
}


require'lspconfig'.phpactor.setup{
  cmd = { 'phpactor', 'language-server' },
  filetypes = {'php'},
  root_dir = util.root_pattern('composer.json', '.git'),
  capabilities = require("util").capabilities,
  on_attach = require("util").on_attach,
}


function GoImports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
  if not result or #result == 0 then
    return
  end
  if result == nil then
    return
  end
  if result[1].result == nil then
    return
  end
  local actions = result[1].result
  if not actions then
    return
  end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, vim.lsp.client().offset_encoding)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
