vim.g.loaded = 1;
vim.g.loaded_netrwPlugin = 1;

-- docs: https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
require("nvim-tree").setup({
  auto_reload_on_write = true,
  open_on_setup = true,
  renderer = {
    icons = {
      show = {
        file = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  sort_by = "name",
  view = {
    side = "left",
    mappings = {
      list = {
        -- { key = {"<CR>", "o" }, action = "edit", mode = "n"}, 
        -- open vertically
        { key = "s", action = "vsplit" },
        -- open horizontally
        { key = "i", action = "split"},
        -- Focus on Folder
        { key = "i", action = "split"},
      },
    },
  },
})
