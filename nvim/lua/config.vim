"LazyGit
let g:lazygit_floating_window_winblend = 1 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.93 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 0 " fallback to 0 if neovim-remote is not installed
let g:lazygit_floating_window_use_plenary = 0
let g:lazygit_use_custom_config_file_path = 1 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = '~/.files/lazygit/config.yml' " custom config file path

colorscheme gruvbox

let g:airline_theme='gruvbox'

" Svelte
let g:svelte_preprocessors = ['typescript']
