require'nvim-treesitter.configs'.setup {
  ignore_install = {},
  modules = {},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  ensure_installed = {
    'bash',
    'dockerfile',
    'gitignore',
    'gitignore',
    'go',
    'gomod',
    'html',
    'json',
    'json5',
    'lua',
    'make',
    'markdown',
    'php',
    'proto',
    'rust',
    'typescript',
    'yaml',
    'zig',
  },
}
