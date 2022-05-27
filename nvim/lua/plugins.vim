" installing plugins
call plug#begin("$HOME/.config/dotfiles/nvim/plugged")

" Linter
Plug 'mfussenegger/nvim-lint'

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
Plug 'scrooloose/nerdtree'
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" ----------------------------------------------------------------

""" Programming Languages 
" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'neovimhaskell/haskell-vim'

" Go
Plug 'fatih/vim-go'

" Markdown
Plug 'ixru/nvim-markdown'

" Rust
Plug 'simrat39/rust-tools.nvim'

" ----------------------------------------------------------------

call plug#end()
" finishing installing plugins

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
