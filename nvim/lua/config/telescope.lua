require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    file_ignore_patterns = {
      -- folders
      "vendor/", 
      -- files
      "%.lock"
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}
