local nvim_lsp = require('lspconfig')
local root_dir = require("lspconfig.util").root_pattern(...)

nvim_lsp.gopls.setup{
  cmd = {'gopls', 'serve'},
  -- for postfix snippets and analyzers
  capabilities = require("util").capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      usePlaceholders = true,
      hoverKind = "FullDocumentation",
      analyses = {
        assign = true,
        atomic = true,
        bools = true,
        composites = true,
        copylocks = true,
        fieldalignment = true,
        httpresponse = true,
        ifaceassert = true,
        infertypeargs = true,
        lostcancel = true,
        nilness = true,
        shadow = true,
        simplifycompositelit = true,
        unusedwrite = true,
        useany = true,
        unreachable = true,
        unusedvariable = true,
        fillstruct = true,
        unusedparams = true,
      },
      annotations = {
        bounds = true,
        escape = true,
        inline = true,
      },
      codelenses = {
        tidy = true,
        run_vulncheck_exp = true,
      },
      diagnosticsDelay = "60ms", 
      hoverKind = "FullDocumentation",
      staticcheck = true,
      usePlaceholders = true,
    },
  },
  on_attach = require("util").on_attach,
}

nvim_lsp.ocamllsp.setup{
  cmd = {'ocamllsp'},
  filetypes = {'ocaml', 'ocaml.menhir', 'ocaml.interface', 'ocaml.ocamllex', 'reason', 'dune'},
  root_dir = root_dir('*.opam', 'esy.json', 'package.json', '.git', 'dune-project', 'dune-workspace'),
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,
}

nvim_lsp.tsserver.setup{
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,
}

nvim_lsp.pyright.setup{
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,
}

nvim_lsp.solargraph.setup{
  capabilities = require("util").capabilities,
  settings = {
    solargraph = {
      commandPath = '$HOME/.asdf/shims/solargraph',
      diagnostics = true,
      completion = true
    },
  },
  on_attach = require("util").on_attach,
}

local rustOpts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        capabilities = require("util").capabilities,
        on_attach = require("util").on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "check"
                },
                cargo = {
                  autoreload = "true"
                }
            }
        }
    },
}

require('rust-tools').setup(opts)

nvim_lsp.hls.setup{
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
}

require'lspconfig'.svelte.setup{
  cmd = {'svelteserver', '--stdio'},
  filetypes = {'svelte'},
  root_dir = root_dir('package.json', '.git'),
  capabilities = require("util").capabilities,
  on_attach = require("util").on_attach,
  -- default values
  --settings = {
     --= {
    --},
  --},
}

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or #result == 0 then
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
