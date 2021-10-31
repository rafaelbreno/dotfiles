local fn, api = vim.fn, vim.api

local Util = {}

P = function(stuff)
  print(vim.inspect(stuff))
  return stuff
end

Util.trigger_completion = function()
  if fn.pumvisible() ~= 0 and fn.complete_info()["selected"] ~= -1 then
    return fn["compe#confirm"]()
  end

  local prev_col, next_col = fn.col "." - 1, fn.col "."
  local prev_char = fn.getline("."):sub(prev_col, prev_col)
  local next_char = fn.getline("."):sub(next_col, next_col)

  -- minimal autopairs-like behaviour
  --if prev_char == "{" and next_char ~= "}" then return Util.t("<CR>}<C-o>O") end
  --if prev_char == "[" and next_char ~= "]" then return Util.t("<CR>]<C-o>O") end
  --if prev_char == "(" and next_char ~= ")" then return Util.t("<CR>)<C-o>O") end
  --if prev_char == ">" and next_char == "<" then return Util.t("<CR><C-o>O") end -- html indents
  --if prev_char == "(" and next_char == ")" then return Util.t("<CR><C-o>O") end -- flutter indents

  return Util.t "<CR>"
end

local to_rgb = function(hex)
  if #hex == 9 then
    local _, r, g, b, a = hex:match "(.)(..)(..)(..)(..)"
    return string.format(
      "rgba(%s, %s, %s, %s)",
      tonumber("0x" .. r),
      tonumber("0x" .. g),
      tonumber("0x" .. b),
      tonumber("0x" .. a)
    )
  end

  local _, r, g, b = hex:match "(.)(..)(..)(..)"
  return string.format(
    "rgb(%s, %s, %s)",
    tonumber("0x" .. r),
    tonumber("0x" .. g),
    tonumber("0x" .. b)
  )
end

local to_hex = function(rgb)
  if #rgb >= 16 then
    local r, g, b, a = rgb:match "%((%d+),%s(%d+),%s(%d+),%s(%d+)"
    return string.format("#%x%x%x%x", r, g, b, a)
  end

  local r, g, b = rgb:match "%((%d+),%s(%d+),%s(%d+)"
  return string.format("#%x%x%x", r, g, b)
end

-- convert colours
Util.convert_colour = function(mode)
  local result

  if mode == "rgb" then
    result = to_rgb(Util.get_word())
  elseif mode == "hex" then
    result = to_hex(Util.get_word())
  else
    return print "Not Supported!"
  end

  vim.cmd(string.format("s/%s/%s", Util.get_word(), result))
end

vim.cmd [[
  command! -nargs=? -range=% ToRgb call v:lua.Util.convert_color('rgb')
  command! -nargs=? -range=% ToHex call v:lua.Util.convert_color('hex')
]]

Util.get_word = function()
  local first_line, last_line = fn.getpos("'<")[2], fn.getpos("'>")[2]
  local first_col, last_col = fn.getpos("'<")[3], fn.getpos("'>")[3]
  return fn.getline(first_line, last_line)[1]:sub(first_col, last_col)
end

Util.t = function(cmd)
  return api.nvim_replace_termcodes(cmd, true, true, true)
end

Util.borders = {
  -- fancy border
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },

  -- padding border
  -- {"▄", "Bordaa"},
  -- {"▄", "Bordaa"},
  -- {"▄", "Bordaa"},
  -- {"█", "Bordaa"},
  -- {"▀", "Bordaa"},
  -- {"▀", "Bordaa"},
  -- {"▀", "Bordaa"},
  -- {"█", "Bordaa"}
}

--Util.lsp_on_attach = function()
  --require("modules.lsp.mappings").lsp_mappings()
--end

Util.lsp_on_init = function()
  print "Language Server Client successfully started!"
end

-- configure mappings for lsp attachment
Util.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require("lsp_signature").on_attach()
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>E', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

return Util
