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

-- Yaml
require('lsp_config/yaml');

-- Roslyn
require('lsp_config/roslyn');

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "pyright",
  "zls",
  "ocamllsp",
  "yamlls",
  "hls",
})
