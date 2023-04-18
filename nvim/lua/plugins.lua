local Plug = vim.fn['plug#'];

vim.call('plug#begin', '$HOME/.files/nvim/plugged')

-- File Explorer
Plug('kyazdani42/nvim-tree.lua')

-- Linter
Plug('mfussenegger/nvim-lint')

------ Themes
-- Gruvbox:
Plug('morhetz/gruvbox')

------ Misc
-- Auto close {[()]}
Plug('jiangmiao/auto-pairs')

-- Status Line
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

-- Git TIU
Plug('kdheepak/lazygit.nvim')

-- Git Blamer (inline log)
Plug('APZelos/blamer.nvim')

-- Syntax Highlighting
---- TreeSitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update

---- TODO:
Plug 'folke/todo-comments.nvim'


-- Nerd:
Plug('preservim/nerdcommenter')

-- NvimLSP
Plug('neovim/nvim-lspconfig')

-- Autocomplete:
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/nvim-cmp')

-- Snippets
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/vim-vsnip-integ')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- Pretty Error messages
Plug('folke/trouble.nvim')

----------------------------------------------------------------

------ Programming Languages 

-- HTML
Plug('othree/html5.vim')

-- Javaescripto
Plug('pangloss/vim-javascript')

-- TypeEscripto
Plug('HerringtonDarkholme/yats.vim')

-- PHP
Plug('StanAngeloff/php.vim')
Plug('stephpy/vim-php-cs-fixer')

-- Go
Plug('fatih/vim-go')

-- Rust
Plug('simrat39/rust-tools.nvim')

-- Zig
Plug('ziglang/zig.vim')

----------------------------------------------------------------

------ Frameworks/Libs

-- Svelte
Plug('evanleck/vim-svelte', {branch = 'main'})

----------------------------------------------------------------

------ Latex

----------------------------------------------------------------
vim.call('plug#end')
