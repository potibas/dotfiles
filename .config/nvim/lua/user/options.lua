local options = {
  termguicolors = true,     -- Use 24-bit colors on terminal
  number = true,            -- Show number column
  wrap = true,              -- Wrap text by default
  cursorline = true,        -- Highlgiht the text line under the cursor

  -- Tabs
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Avoid conflict with tree-sitter
vim.cmd [[syntax off]]
