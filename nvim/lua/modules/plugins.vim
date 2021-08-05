" installing plugins
call plug#begin("$HOME/.config/dotfiles/nvim/plugged")

""" Themes
" Gruvbox:
Plug 'morhetz/gruvbox'

" ----------------------------------------------------------------

""" Misc
" Auto close {[()]}
Plug 'jiangmiao/auto-pairs'

" Git TIU
Plug 'kdheepak/lazygit.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" NVIM-LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'nvim-lua/completion-nvim'

" CodeSnippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Nerd:
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'

" ----------------------------------------------------------------

""" Programming Languages 
" Go:
Plug 'fatih/vim-go'

" OCaml:
Plug 'ocaml/vim-ocaml'

" ----------------------------------------------------------------

call plug#end()
" finishing installing plugins


" COC plugins
let g:coc_global_extensions = [ 'coc-go', 'coc-json' ]
"let g:coc_global_extensions += []

" LazyGit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" Theme
colorscheme gruvbox

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Snippets
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" TreeSitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF
