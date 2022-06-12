" installing plugins
call plug#begin("$HOME/.config/dotfiles/nvim/plugged")

""" Themes
" Gruvbox:
Plug 'morhetz/gruvbox'

" ----------------------------------------------------------------

""" Misc
" Auto close {[()]}
Plug 'jiangmiao/auto-pairs'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd:
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'

" ----------------------------------------------------------------

""" Programming Languages 
" Go:
Plug 'fatih/vim-go'

" OCaml:
Plug 'ocaml/vim-ocaml'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'cespare/vim-toml'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Haskell
Plug 'neovimhaskell/haskell-vim'

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

" VimGo
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"

" Haskell
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

" Theme
colorscheme gruvbox

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Lint Engine
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1


" Snippets
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger="<s-enter>"
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

" Vim Airline
let g:airline_theme='minimalist'
