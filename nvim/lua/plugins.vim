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

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Nerd:
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'

" NvimLSP
Plug 'neovim/nvim-lspconfig'

" Autocomplete:
Plug 'nvim-lua/completion-nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" ----------------------------------------------------------------

""" Programming Languages 

" ----------------------------------------------------------------

call plug#end()
" finishing installing plugins

