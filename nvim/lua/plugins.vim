" installing plugins
call plug#begin("$HOME/.files/nvim/plugged")

" File Explorer
Plug 'kyazdani42/nvim-tree.lua'

" Linter
Plug 'mfussenegger/nvim-lint'

" Nice syntax colors
Plug 'sheerun/vim-polyglot'

""" Themes
" Gruvbox:
Plug 'morhetz/gruvbox'

""" Misc
" Auto close {[()]}
Plug 'jiangmiao/auto-pairs'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git TIU
Plug 'kdheepak/lazygit.nvim'
Plug 'APZelos/blamer.nvim'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tree-sitter/tree-sitter-haskell'

" Nerd:
Plug 'preservim/nerdcommenter'

" NvimLSP
Plug 'neovim/nvim-lspconfig'

" Ale
Plug 'dense-analysis/ale'

" Autocomplete:
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Pretty Error messages
Plug 'folke/trouble.nvim'

" ----------------------------------------------------------------

""" Programming Languages 

" HTML
Plug 'othree/html5.vim'

" Javaescripto
Plug 'pangloss/vim-javascript'

" TypeEscripto
Plug 'HerringtonDarkholme/yats.vim'

" Go
Plug 'fatih/vim-go'

" Markdown
"Plug 'ixru/nvim-markdown'

" Rust
Plug 'simrat39/rust-tools.nvim'

" ----------------------------------------------------------------

""" Frameworks/Libs

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" ----------------------------------------------------------------

call plug#end()
" finishing installing plugins
