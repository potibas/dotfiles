vim.g.mapleader = ' '

vim.opt.termguicolors = true
vim.opt.bg = 'dark'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'yes'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- Indenting
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Don't insert comments on new lines
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
