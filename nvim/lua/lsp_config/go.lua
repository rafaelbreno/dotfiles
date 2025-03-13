local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lspconfig.gopls.setup{
  cmd = {'gopls', 'serve'},
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
  capabilities = require("util").capabilities,
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        assign = true,
        atomic = true,
        bools = true,
        composites = true,
        copylocks = true,
        fieldalignment = true,
        fillstruct = true,
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
        unusedparams = true,
      },
      experimentalPostfixCompletions = true,
      completeUnimported = true,
      staticcheck = true,
      usePlaceholders = true,
      hoverKind = "FullDocumentation",
      linkTarget = "pkg.go.dev",
      vulncheck = "Imports",
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
    },
  },
  on_attach = function (client, bufnr)
    -- Call the common on_attach function
    require("util").on_attach(client, bufnr)

    -- Additional Go-specific settings
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- Go specific keymaps
    buf_set_keymap('n', '<leader>goc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>goi', '<cmd>lua require("go.implement").impl()<CR>', opts)

     -- Add hovering documentation with Ctrl+K specifically for Golang
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    
    -- Enable inlay hints if available (requires Neovim 0.10+)
    if client.server_capabilities.inlayHintProvider and vim.fn.has('nvim-0.10') == 1 then
      vim.lsp.inlay_hint.enable(true)
    end  

    -- Automatically format Go files on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

-- Function to run GoImports on save (this organizes imports)
function GoImports(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }
  
  local params = vim.lsp.util.make_range_params()
  params.context = context
  
  -- See the implementation of the textDocument/codeAction callback
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  
  local actions = result[1].result
  if not actions then return end
  
  local action = actions[1]
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

-- Setup an autocommand to run GoImports on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    GoImports(1000)
  end,
})
