" map leader
let g:mapleader = ","
let g:maplocalleader = ","

" disable builtin plugins I don't use
let g:loaded_gzip         = 1
let g:loaded_tar          = 1
let g:loaded_tarPlugin    = 1
let g:loaded_zipPlugin    = 1
let g:loaded_2html_plugin = 1
let g:loaded_netrw        = 1
let g:loaded_netrwPlugin  = 1
let g:loaded_matchit      = 1
let g:loaded_matchparen   = 1
let g:loaded_spec         = 1


" importing lua scripts
runtime! lua/plugins.vim
runtime! lua/keymaps.lua
runtime! lua/options.lua
runtime! lua/mapping.vim
runtime! lua/statusline.lua
runtime! lua/config.vim
runtime! lua/autocomplete.lua

lua require("lsp_go")

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)
