local o = vim.opt

o.autoindent     = true -- enable autoindent
o.autowrite      = true -- autowrite buffer when it's not focused
o.backupcopy     = "yes" -- fix weirdness for stuff that replaces the entire file when hot reloading
o.backup         = false -- disable backup
o.clipboard      = "unnamedplus" -- allow clipboard
o.completeopt    = {
	"menu",
	"menuone",
	"noselect",
	"noinsert",
} -- better completion
-- o.colorcolumn    = { "80" } -- 80 chars color column
o.cursorline     = true -- enable cursorline
o.encoding       = "UTF-8" -- set encoding
o.equalalways    = true -- make window size always equal
o.expandtab      = true -- use spaces instead of tabs
o.filetype       = "on"
o.fillchars      = {
	vert = "│",
	eob = " ",
	fold = " ",
	diff = " ",
} -- make vertical split sign better
o.foldmethod     = "indent"
o.foldopen       = {
	"percent",
	"search",
} -- don't open fold if I don't tell it to do so
 --o.foldexpr       = "nvim_treesitter#foldexpr()"
 o.foldlevel      = 99 -- don't fold anything if I don't tell it to do so
-- o.foldnestmax    = 1 -- only allow 1 nested folds it can be confusing if I have too many
-- o.foldcolumn     = "1" -- enable fold column for better visualisation
-- stolen from tjdevries
o.formatoptions = o.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore
o.hidden         = false -- keep hidden buffers
o.hlsearch       = false -- don't highlight matching search
o.ignorecase     = true -- case insensitive on search..
o.inccommand     = "split" -- incrementally show result of command
o.joinspaces     = false
o.laststatus     = 2 -- always enable statusline
o.lazyredraw     = true -- lazyredraw to make macro faster
o.list           = true -- display listchars
o.listchars      = {
	eol = "↲",
	tab= "» ",
} -- set listchars
o.mouse          = "n" -- enable mouse support in normal mode
o.number         = true -- enable number
o.pumheight      = 10 -- limit completion items
o.re             = 0 -- set regexp engine to auto
o.relativenumber = true -- enable relativenumber
o.scrolloff      = 2 -- make scrolling better
o.shell          = "/bin/bash" -- use bash instead of zsh
o.shiftwidth     = 2 -- set indentation width
o.shortmess      = "csa" -- disable some stuff on shortmess
o.showmode       = false -- don't show mode
o.sidescroll     = 2 -- make scrolling better
o.sidescrolloff  = 15 -- make scrolling better
o.signcolumn     = "yes" -- enable sign column all the time 4 column
o.smartcase      = true -- ..unless there's a capital
o.smartindent    = true -- smarter indentation
o.smarttab       = true -- make tab behaviour smarter
o.splitbelow     = true -- split below instead of above
o.splitright     = true -- split right instead of left
o.startofline    = false -- don't go to the start of the line when moving to another file
o.swapfile       = false -- disable swap
o.swapfile       = false -- disable swapfile
o.tabstop        = 2 -- tabsize
o.termguicolors  = true -- truecolours for better experience
o.timeoutlen     = 300 -- faster timeout wait time
o.undofile       = true -- persistent undo
o.updatetime     = 1000 -- set faster update time
o.wrap           = false -- dont wrap lines
o.writebackup    = false -- disable backup
