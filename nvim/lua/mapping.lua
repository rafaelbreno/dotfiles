local g = vim.g;

---- Leader
--  Here I'm setting both Leader and Local Leader
-- with the same key because I don't want to 
-- miscreate a shortcut that only works for
-- specific files.
g.mapleader      = ','; -- Map Leader
g.maplocalleader = ','; -- Map Local Leader

------ Key Mapping
---- Declarations 
-- Set Function
local set = vim.keymap.set;
local au = vim.api.nvim_create_autocmd;

-- silent option - <silent>
local sOpt = { silent = true };
-- No Remap option - <noremap>
local nOpt = { noremap = true };
-- <silent> & <noremap>
local snOpt = { silent = true, noremap = true };

---- Plugins
-- NvimTree
set({'n'}, '<leader>ne', ':NvimTreeFocus<cr>', snOpt)
set({'n'}, '<leader>nt', ':NvimTreeToggle<cr>', snOpt)
set({'n'}, '<leader>nr', ':NvimTreeRefresh<cr>', snOpt)

-- LazyGit
set({'n'}, '<leader>lg', ':LazyGit<CR>', snOpt)

-- Telescope
set({'n'}, '<leader>ff', '<cmd>Telescope find_files<cr>', snOpt)
set({'n'}, '<leader>fg', '<cmd>Telescope live_grep<cr>', snOpt)
set({'n'}, '<leader>fb', '<cmd>Telescope buffers<cr>', snOpt)
set({'n'}, '<leader>fh', '<cmd>Telescope help_tags<cr>', snOpt)

-- Trouble
set({'n'}, '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', snOpt)
set({'n'}, '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', snOpt)
set({'n'}, '<leader>xd', '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>', snOpt)
set({'n'}, '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', snOpt)
set({'n'}, '<leader>xl', '<cmd>TroubleToggle loclist<cr>', snOpt)
set({'n'}, 'gR', '<cmd>TroubleToggle lsp_references<cr>', snOpt)

---- General
-- Move between Terminals
set({'t'}, '<C-h>', '<C-\\><C-n><C-w><C-h>', snOpt)
set({'t'}, '<C-j>', '<C-\\><C-n><C-w><C-j>', snOpt)
set({'t'}, '<C-k>', '<C-\\><C-n><C-w><C-k>', snOpt)
set({'t'}, '<C-l>', '<C-\\><C-n><C-w><C-l>', snOpt)
set({'n'}, '<C-h>', '<C-w><C-h>')
set({'n'}, '<C-j>', '<C-w><C-j>')
set({'n'}, '<C-k>', '<C-w><C-k>')
set({'n'}, '<C-l>', '<C-w><C-l>')

-- Resize Terminal
set({'t'}, '<Left> ', '<C-><C-n>:vertical resize +2<CR>', sOpt)
set({'t'}, '<Right>', '<C-><C-n>:vertical resize -2<CR>', sOpt)
set({'t'}, '<Up>', '<C-><C-n>:resize   +2<CR>', sOpt)
set({'t'}, '<Down>', '<C-><C-n>:resize   -2<CR>', sOpt)
set({'n'}, '<Left>', '<CMD>vertical resize +2<CR>', sOpt)
set({'n'}, '<Right>', '<CMD>vertical resize -2<CR>', sOpt)
set({'n'}, '<Up>', '<CMD>resize   +2<CR>', sOpt)
set({'n'}, '<Down>', '<CMD>resize   -2<CR>', sOpt)

-- Save/Exit
set({'n'}, '<leader>w', ':w<cr>', sOpt)
set({'n'}, '<leader>q', ':wq<cr>', sOpt)

-- Reload
set({'n'}, '<leader>rl', ':LspRestart<cr>', sOpt)
set({'n'}, '<leader>rc', ':source $MYVIMRC<cr>', sOpt)

-- Fold
set({'n'}, '<leader>z', 'za', snOpt) -- Fold toggle
set({'n'}, '<leader>Z', function()
  if vim.wo.foldlevel > 0 then
    vim.cmd('normal! zM')  -- Close all
  else
    vim.cmd('normal! zR')  -- Open all
  end
end, snOpt)

-- remove annoying exmode
set({'n'}, 'Q', '<Nop>', nOpt)
set({'n'}, 'q:', '<Nop>', nOpt)

-- Move Lines
set({'n'}, '<A-j>', ':m .+1<CR>==', nOpt)
set({'n'}, '<A-k>', ':m .-2<CR>==', nOpt)
set({'i'}, '<A-j>', '<Esc>:m .+1<CR>==gi', nOpt)
set({'i'}, '<A-k>', '<Esc>:m .-2<CR>==gi', nOpt)
set({'v'}, '<A-j>', ':m \'>+1<CR>gv=gv', nOpt)
set({'v'}, '<A-k>', ':m \'<-2<CR>gv=gv', nOpt)

-- Indent
set({'v'}, '<', '<gv', nOpt)
set({'v'}, '>', '>gv', nOpt)

-- JSON Indent
local jq_callback = function ()
    set('n', '<leader>jq', '<cmd>%!jq<cr>', snOpt)
end

au("FileType", {
  pattern = "json",
  callback = jq_callback,
})
