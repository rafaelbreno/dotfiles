"LazyGit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" GitLens
let g:blamer_enabled = 1
let g:blamer_delay = 200
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' > '
let g:blamer_template = '<committer>, <committer-time> • <summary>'
let g:blamer_date_format = '%d/%m/%y'

colorscheme gruvbox

let g:airline_theme='minimalist'

" Ale
let g:ale_linters = {
\   'go': ['revive']
\}

let g:ale_hover_to_preview = 1
let g:ale_set_ballons = 1

" Svelte
let g:svelte_preprocessors = ['typescript']
