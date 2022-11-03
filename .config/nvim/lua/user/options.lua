local g = vim.g
local o = vim.o

g.mapleader = ','

o.termguicolors = true
o.number = true
o.wrap = true

-- tabs
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

vim.cmd [[syntax off]]
