local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.haskell = {
  install_info = {
    url = "../../plugger/tree-sitter-haskell",
    files = { "src/parser.c", "src/parser.cc" },
  }
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
