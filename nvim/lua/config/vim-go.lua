local g = vim.g;

-- Basic vim-go setup
g.go_fmt_autosave = 1
g.go_fmt_command = 'goimports'

-- Optional: Explicitly set the path to your Go binaries
g.go_bin_path = vim.fn.expand('$HOME/go/bin')

-- Optional: Disable vim-go's version warning
g.go_version_warning = 0

-- Optional: Configure gopls if you're using it
g.go_gopls_enabled = true
g.go_gopls_options = {'-remote=auto'}
