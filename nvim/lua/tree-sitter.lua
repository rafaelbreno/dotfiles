local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    'bash',
    'dockerfile',
    'gitignore',
    'go', 
    'gomod', 
    'json',
    'json5',
    'lua',
    'proto',
    'rust',
    'yaml',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
}
