-- nvim/lua/config/autocomplete_debug.lua
-- This file helps diagnose completion issues

local M = {}

-- Function to check if nvim-cmp is loaded properly
function M.check_nvim_cmp()
  local has_cmp, cmp = pcall(require, 'cmp')
  if not has_cmp then
    print("ERROR: nvim-cmp is not installed or loaded properly")
    return false
  else
    print("SUCCESS: nvim-cmp is properly loaded")
    return true
  end
end

-- Function to check if the LSP source for cmp is configured
function M.check_lsp_source()
  local has_cmp, cmp = pcall(require, 'cmp')
  if not has_cmp then return false end
  
  local sources = cmp.get_config().sources
  local has_lsp_source = false
  
  for _, source in ipairs(sources) do
    if source.name == 'nvim_lsp' then
      has_lsp_source = true
      break
    end
  end
  
  if has_lsp_source then
    print("SUCCESS: nvim_lsp source is configured in nvim-cmp")
    return true
  else
    print("ERROR: nvim_lsp source is NOT configured in nvim-cmp")
    return false
  end
end

-- Function to check if the Go LSP server is running
function M.check_go_lsp()
  local clients = vim.lsp.get_active_clients()
  local gopls_running = false
  
  for _, client in ipairs(clients) do
    if client.name == "gopls" then
      gopls_running = true
      print("SUCCESS: gopls is running as client id: " .. client.id)
      -- Check if the current buffer is attached
      local buf = vim.api.nvim_get_current_buf()
      if vim.lsp.buf_is_attached(buf, client.id) then
        print("SUCCESS: Current buffer is attached to gopls")
      else
        print("ERROR: Current buffer is NOT attached to gopls")
      end
      break
    end
  end
  
  if not gopls_running then
    print("ERROR: gopls is NOT running as an LSP client")
    return false
  end
  
  return gopls_running
end

-- Function to check if the current file is a Go file
function M.check_go_filetype()
  local ft = vim.bo.filetype
  if ft == 'go' then
    print("SUCCESS: Current file is recognized as Go filetype")
    return true
  else
    print("ERROR: Current file is NOT recognized as Go (current filetype: " .. ft .. ")")
    return false
  end
end

-- Run all checks
function M.run_diagnostics()
  print("======= Go Completion Diagnostics =======")
  print("Running diagnostics for Go completion...")
  
  local cmp_ok = M.check_nvim_cmp()
  local lsp_source_ok = M.check_lsp_source()
  local go_ft_ok = M.check_go_filetype()
  local go_lsp_ok = M.check_go_lsp()
  
  print("\n======= Summary =======")
  if cmp_ok and lsp_source_ok and go_ft_ok and go_lsp_ok then
    print("All checks passed! If completion still doesn't work, there might be a more subtle issue.")
  else
    print("Some checks failed. Please review the messages above.")
  end
  
  -- Check for keybinding conflicts
  print("\n======= Keybinding Checks =======")
  local mappings = vim.api.nvim_get_keymap('i')
  for _, map in ipairs(mappings) do
    if map.lhs == '<Tab>' or map.lhs == '<C-Space>' or map.lhs == '<CR>' then
      print("Found mapping for " .. map.lhs .. ": " .. vim.inspect(map))
    end
  end
  
  print("\n======= End of Diagnostics =======")
end

-- Add a command to run the diagnostics
vim.api.nvim_create_user_command('GoCompletionDebug', function()
  M.run_diagnostics()
end, {})

return M
