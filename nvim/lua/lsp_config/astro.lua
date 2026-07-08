-- nvim/lua/lsp_config/astro.lua
local function check_astro_ls()
  if vim.fn.executable('astro-ls') == 1 then
    return true
  end
  vim.notify("astro-ls not found. Run: npm install -g @astrojs/language-server", vim.log.levels.WARN)
  return false
end

-- Resolves the TypeScript SDK path from the global npm root.
-- The Astro LSP delegates TS type checking to this SDK.
local function get_typescript_sdk()
  local npm_root = vim.fn.system("npm root -g"):gsub("%s+$", "")
  return npm_root .. "/typescript/lib"
end

if check_astro_ls() then
  vim.lsp.config("astro", {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    init_options = {
      typescript = {
        tsdk = get_typescript_sdk(),
      },
    },
    on_attach = function(client, bufnr)
      require("util").on_attach(client, bufnr)
      vim.notify("astro-ls attached", vim.log.levels.DEBUG)
    end,
    capabilities = require("util").capabilities,
  })
end
