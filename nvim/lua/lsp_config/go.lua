-- nvim/lua/lsp_config/go.lua
local lspconfig = require('lspconfig')

-- Check if gopls exists in the system
local function check_gopls()
  local handle = io.popen("which gopls")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= "" then
      print("Found gopls at: " .. result)
      return true
    else
      print("WARNING: gopls not found in PATH. Go autocompletion will not work.")
      print("Run 'go install golang.org/x/tools/gopls@latest' to install it.")
      return false
    end
  end
  return false
end

if check_gopls() then
  lspconfig.gopls.setup {
    cmd = {'gopls', 'serve'},
    filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        usePlaceholders = true,
        completeUnimported = true,
        matcher = "fuzzy",
        experimentalPostfixCompletions = true,
        hoverKind = "FullDocumentation",
      },
    },
    init_options = {
      usePlaceholders = true,
    },
    on_attach = function(client, bufnr)
      -- Call the common on_attach function
      require("util").on_attach(client, bufnr)
      
      -- Go-specific keymaps
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap=true, silent=true }
      
      -- Add <C-k> hover specifically for Go
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      
      -- Print a message confirming Go LSP setup
      print("Go LSP attached to buffer")
    end,
    capabilities = require("util").capabilities
  }
end

-- Add debug command
vim.api.nvim_create_user_command('GoLSPDebug', function()
  local gopls_running = false
  for _, client in pairs(vim.lsp.get_active_clients()) do
    if client.name == "gopls" then
      print("gopls is running as client id: " .. client.id)
      gopls_running = true
      break
    end
  end
  
  if not gopls_running then
    print("gopls is NOT running as an LSP client")
  end
  
  -- Check if gopls binary exists
  check_gopls()
  
  -- Check capabilities
  local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  print("Completion capabilities configured: " .. vim.inspect(cmp_capabilities.textDocument.completion ~= nil))
end, {})
