local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

require'nvim-treesitter.configs'.setup {
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
    'proto',
    'rust',
    'typescript',
    'yaml',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
}
