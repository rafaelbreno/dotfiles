local util = require('lspconfig.util')

require'lspconfig'.ocamllsp.setup{
  cmd = {'ocamllsp'},
  filetypes = {'ocaml', 'ocaml.menhir', 'ocaml.interface', 'ocaml.ocamllex', 'reason', 'dune'},
  root_dir = util.root_pattern('*.opam', 'esy.json', 'package.json', '.git', 'dune-project', 'dune-workspace'),
  capabilities = require("util").capabilities,
  settings = {},
  on_attach = require("util").on_attach,

}
