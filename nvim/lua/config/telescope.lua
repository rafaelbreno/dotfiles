require("telescope").setup{
  defaults = {
    file_ignore_patterns = {
      -- folders
      "vendor/", 
      -- files
      "%.lock"
    }
  }
}
