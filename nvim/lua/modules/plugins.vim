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

" LSP coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd:
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'

" ----------------------------------------------------------------

""" Programming Languages 
" Go:
Plug 'fatih/vim-go'

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
