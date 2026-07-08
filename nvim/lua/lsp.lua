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

-- postgres
require('lsp_config/postgres');

-- TS/JS
require('lsp_config/ts');

-- Astro
require('lsp_config/astro');

vim.lsp.enable({
  "astro",
  "gopls",
  "hls",
  "lua_ls",
  "ocamllsp",
  "postgres_lsp",
  "pyright",
  "ts_ls",
  "yamlls",
})
